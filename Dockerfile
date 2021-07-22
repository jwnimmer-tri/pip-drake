#-------------------------------------------------------------------------------
# Create a base provisioned image
#-------------------------------------------------------------------------------

FROM ubuntu:18.04 AS base

ADD image/provision.sh /image/

ENV DEBIAN_FRONTEND=noninteractive
RUN /bin/bash /image/provision.sh

#-------------------------------------------------------------------------------
# Build Drake's dependencies
#-------------------------------------------------------------------------------

FROM base AS incubator

ADD image/build-dependencies.sh /image/

RUN /bin/bash /image/build-dependencies.sh
