#!/bin/bash -e

mkdir -p /drake-dependencies
cd /drake-dependencies

git clone https://github.com/RobotLocomotion/pip-drake-dependencies.git src

mkdir -p /drake-dependencies/build
cd /drake-dependencies/build

cmake -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/opt/drake-dependencies \
  /drake-dependencies/src

ninja

ln -s /opt/drake-dependencies/lib/pkgconfig /usr/local/lib
ln -s /opt/drake-dependencies/share/pkgconfig /usr/local/share
