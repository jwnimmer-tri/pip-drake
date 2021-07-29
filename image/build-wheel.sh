#!/bin/bash -e

# FIXME
apt install -y libglib2.0-dev

cd /

git clone https://github.com/robotlocomotion/drake

cd /drake

git apply < /image/pip-drake.patch

bazel run \
    --define NO_CLP=ON \
    --define NO_IPOPT=ON \
    --define NO_DREAL=ON \
    //:install -- /opt/drake
