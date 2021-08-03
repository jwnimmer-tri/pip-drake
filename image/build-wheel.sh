#!/bin/bash -e

cd /

git clone https://github.com/robotlocomotion/drake

cd /drake

git apply < /image/pip-drake.patch

bazel run \
    --define NO_CLP=ON \
    --define NO_IPOPT=ON \
    --define NO_DREAL=ON \
    //:install -- /opt/drake

cd /opt && \
    tar --create --gzip --file drakewhl-3.7.tar.gz -- \
    drake-dependencies/lib \
    drake/lib/libdrake*.so \
    drake/lib/python*/site-packages/pydrake \
    drake/share/doc \
    drake/share/drake/.drake-find_resource-sentinel \
    drake/share/drake/examples \
    drake/share/drake/manipulation
