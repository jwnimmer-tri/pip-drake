#!/bin/bash -e

BAZEL_VERSION=4.1.0
BAZEL_ROOT=https://github.com/bazelbuild/bazel/releases/download

ln -s /usr/bin/python3 /usr/bin/python

# Install prerequisites
apt-get -y update

apt-get -y install --no-install-recommends \
    default-jdk \
    python3-dev libpython3-dev python3-pip \
    gcc g++ gfortran libgfortran-7-dev \
    libclang-9-dev clang-format-9 \
    git cmake ninja-build pkg-config \
    yasm patchelf file wget unzip zip

apt-get -y install --no-install-recommends \
    libglib2.0-dev \
    libgl1-mesa-dev libxt-dev \
    opencl-headers ocl-icd-opencl-dev

pip3 install \
    pyyaml \
    semantic-version \
    setuptools \
    wheel \
    auditwheel

# Install bazel
cd /tmp
wget ${BAZEL_ROOT}/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
bash /tmp/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
rm /tmp/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
