#!/bin/bash -e

chrpath()
{
    rpath=$1
    shift 1

    for lib in "$@"; do
        patchelf --remove-rpath "$lib"
        patchelf --set-rpath "$rpath" "$lib"
    done
}

# TODO most of this should move to bazel
mkdir -p /wheel/pydrake/lib
cd /wheel

# TODO we need a different way of shipping non-arch files (examples, models)
cp -r -t /wheel/pydrake \
    /opt/drake/share/doc \
    /opt/drake/share/drake/.drake-find_resource-sentinel \
    /opt/drake/share/drake/examples \
    /opt/drake/share/drake/manipulation \
    /opt/drake/lib/python*/site-packages/pydrake/*

cp -r -t /wheel/pydrake/lib \
    /opt/drake/lib/libdrake*.so

cp -r -t /wheel/pydrake/doc \
    /opt/drake-dependencies/licenses/*

# TODO we need to remove these to keep the wheel from being too large, but (per
# above), the whole trees containing these bits shouldn't be in the wheel
rm /wheel/pydrake/examples/kuka_iiwa_arm/kuka_plan_runner
rm /wheel/pydrake/examples/kuka_iiwa_arm/kuka_simulation
rm /wheel/pydrake/manipulation/models/ycb/meshes/*.png
rm -r /wheel/pydrake/examples/atlas

export LD_LIBRARY_PATH=/wheel/pydrake/lib:/opt/drake-dependencies/lib

chrpath '$ORIGIN/lib' pydrake/*.so
chrpath '$ORIGIN/../lib' pydrake/*/*.so

python setup.py bdist_wheel

GLIBC_VERSION=$(ldd --version | sed -n '1{s/.* //;s/[.]/_/p}')

auditwheel repair --plat manylinux_${GLIBC_VERSION}_x86_64 dist/drake*.whl
