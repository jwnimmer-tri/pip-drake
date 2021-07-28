#!/bin/bash -e

BAZEL_VERSION=4.1.0
BAZEL_ROOT=https://github.com/bazelbuild/bazel/releases/download

ln -s /usr/bin/python3 /usr/bin/python

# Install prerequisites
apt -y update

apt -y install \
    default-jdk python3-pip \
    gfortran libgfortran-7-dev \
    libclang-9-dev clang-format-9 \
    git cmake ninja-build pkg-config \
    yasm wget zip

apt -y install \
    libgl1-mesa-dev \
    opencl-headers ocl-icd-opencl-dev

pip3 install \
    lxml \
    pandas \
    pyyaml \
    semantic-version \
    auditwheel

# Install bazel
cd /tmp
wget ${BAZEL_ROOT}/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
bash /tmp/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
rm /tmp/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
