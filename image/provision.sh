#!/bin/bash

BAZEL_VERSION=4.1.0
BAZEL_ROOT=https://github.com/bazelbuild/bazel/releases/download

ln -s /usr/bin/python3 /usr/bin/python

# Install prerequisites
apt -y update
apt -y install \
    default-jdk python3-pip python3-yaml python3-semantic-version \
    git cmake ninja-build pkg-config gfortran libgfortran-7-dev \
    libgl1-mesa-dev libclang-9-dev clang-format-9 yasm wget zip

pip3 install auditwheel

# Install bazel
cd /tmp
wget ${BAZEL_ROOT}/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
bash /tmp/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
rm /tmp/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
