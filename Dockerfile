# -----------------------------------------------------------------------------
# Create a base provisioned image
# -----------------------------------------------------------------------------

FROM ubuntu:18.04 AS base

ADD image/provision.sh /image/

ENV DEBIAN_FRONTEND=noninteractive
RUN /image/provision.sh

# -----------------------------------------------------------------------------
# Build Drake's dependencies
# -----------------------------------------------------------------------------

FROM base AS incubator

ADD image/build-dependencies.sh /image/
ADD https://api.github.com/repos/robotlocomotion/pip-drake-dependencies/git/refs/heads/master \
    /tmp/drake-dependencies.sha

RUN /image/build-dependencies.sh

ADD image/build-vtk.sh /image/
ADD image/vtk-args /vtk/

RUN /image/build-vtk.sh

# -----------------------------------------------------------------------------
# Build the Drake wheel
# -----------------------------------------------------------------------------

FROM incubator

ADD image/build-wheel.sh /image/
ADD image/pip-drake.patch /image/
ADD https://api.github.com/repos/robotlocomotion/drake/git/refs/heads/master \
    /tmp/drake.sha

RUN /bin/bash /image/build-wheel.sh
