#!/bin/bash

# This shell script uses Docker to build the PyPI wheel and automatically
# extracts the generated wheel to the current directory.

set -e

salt=$(dd if=/dev/urandom bs=2 count=4 | od -An -x | tr -d ' ')
id=pip-drake:$(date -u +%Y%m%d%H%M%S)-$salt

###############################################################################

build()
{
    local id=$1
    shift 1

    # Remove --force-rm if you need to inspect artifacts of a failed build
    docker build --force-rm --tag $id "$@" "$(dirname "${BASH_SOURCE}")"
    trap "docker image rm $id" EXIT
}

extract()
{
    docker run --rm $1 \
        bash -c 'tar -cf - /wheel/wheelhouse/*.whl' | \
        tar --strip-components=2 -xf -
}

###############################################################################

# Build wheel
build $id
extract $id
