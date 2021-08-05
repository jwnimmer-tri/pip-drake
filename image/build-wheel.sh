#!/bin/bash -e

# TODO most of this should move to bazel
mkdir -p wheel/pydrake/lib
cd /wheel

cp -r -t /wheel/pydrake \
    /opt/drake/share/doc \
    /opt/drake/share/drake/.drake-find_resource-sentinel \
    /opt/drake/share/drake/examples \
    /opt/drake/share/drake/manipulation \
    /opt/drake/lib/python*/site-packages/pydrake/*

cp -r -t /wheel/pydrake/lib \
    /opt/drake/lib/libdrake*.so

export LD_LIBRARY_PATH=/wheel/pydrake/lib

python setup.py bdist_wheel

# FIXME
# auditwheel repair dist/pydrake*.whl
