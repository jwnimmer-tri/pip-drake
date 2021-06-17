# -*- mode: dockerfile; -*-
# vi: set ft=dockerfile:

FROM ubuntu:18.04

ENV LOGNAME=root SHELL=/bin/bash USER=root

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 locales \
  && rm -rf /var/lib/apt/lists/* \
  && locale-gen en_US.UTF-8 \
  && sed -i 's/none/en_US/g' /etc/apt/apt.conf.d/docker-no-languages

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get dist-upgrade -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
      -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 \
    ca-certificates \
    curl \
    gnupg \
  && curl -s https://apt.kitware.com/keys/kitware-archive-latest.asc \
    | gpg --dearmor > /etc/apt/trusted.gpg.d/kitware.gpg \
  && echo 'deb https://apt.kitware.com/ubuntu/ bionic main' \
    > /etc/apt/sources.list.d/kitware.list \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 cmake \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
      -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 \
    autoconf \
    automake \
    bison \
    bzip2 \
    diffutils \
    file \
    hardlink \
    hostname \
    make \
    patch \
    unzip \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 python3-dev \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 git \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 libtool \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
      -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 libxcrypt1 \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
      -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 \
    libc6-dev \
    libgl1-mesa-dev \
    libglib2.0-dev \
    libice-dev \
    libsm-dev \
    libstdc++-6-dev \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 patchelf \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
      -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 \
    libbz2-1.0 \
    libcomerr2 \
    libcurl3 \
    libdb5.3 \
    libexpat1 \
    libffi6 \
    libgdbm5 \
    libidn2-0 \
    libkeyutils1 \
    libkrb5-3 \
    liblzma5 \
    libncurses5 \
    libpcap0.8 \
    libreadline7 \
    libssl1.1 \
    tk \
    uuid \
    zlib1g \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
    -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 swig \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
      -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 \
    binutils \
    g++ \
    gcc \
    gfortran \
  && rm -rf /var/lib/apt/lists/*

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install -qy -o Dpkg::Options::=--force-confdef \
      -o Dpkg::Options::=--force-confnew -o Dpkg::Use-Pty=0 \
    ca-certificates \
    curl \
    python3 \
  && rm -rf /var/lib/apt/lists/* \
  && curl -LO https://bootstrap.pypa.io/get-pip.py \
  && python3 get-pip.py \
  && rm -f get-pip.py

RUN pip3 install --disable-pip-version-check --no-cache-dir \
      --no-python-version-warning \
    build==0.4.0 \
    importlib-metadata==4.5.0 \
    packaging==20.9 \
    pep517==0.10.0 \
    pyparsing==2.4.7 \
    toml==0.10.2 \
    typing-extensions==3.10.0.0 \
    wheel==0.36.2 \
    zipp==3.4.1 \
    pip==21.1.2 \
    setuptools==57.0.0

RUN pip3 install --disable-pip-version-check --no-cache-dir \
      --no-python-version-warning \
    argcomplete==1.12.3 \
    auditwheel==4.0.0 \
    certifi==2021.5.30 \
    click==8.0.1 \
    packaging==20.9 \
    pipx==0.16.3 \
    pyelftools==0.27 \
    pyparsing==2.4.7 \
    userpath==1.6.0
