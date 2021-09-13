#!/bin/bash -e

BAZEL_VERSION=4.2.1
BAZEL_ROOT=https://github.com/bazelbuild/bazel/releases/download

# Re-use the download cache across runs, per
# https://github.com/moby/buildkit/blob/v0.9.0/frontend/dockerfile/docs/syntax.md#example-cache-apt-packages
rm -f /etc/apt/apt.conf.d/docker-clean
echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

ln -s /usr/bin/python3 /usr/bin/python

# Install prerequisites
apt-get -y update

apt-get -y install --no-install-recommends \
    autoconf automake default-jdk \
    python3-dev libpython3-dev python3-pip \
    gcc g++ gfortran libgfortran-7-dev \
    libclang-9-dev clang-format-9 \
    git cmake ninja-build pkg-config \
    yasm file wget unzip zip

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
