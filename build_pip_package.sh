#!/usr/bin/env bash
# Copyright 2015 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================


set -e

function is_absolute {
  [[ "$1" = /* ]] || [[ "$1" =~ ^[a-zA-Z]:[/\\].* ]]
}

function real_path() {
  is_absolute "$1" && echo "$1" || echo "$PWD/${1#./}"
}

function usage() {
  echo "Usage:"
  echo "$0 --src srcdir --dst dstdir"
  echo ""
  echo "    --src                 prepare sources in srcdir"
  echo ""
  echo "    --dst                 build wheel in dstdir"
  echo ""
  exit 1
}

function main() {
  SRCDIR=""
  DSTDIR=""
  POSITIONAL=()
  while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
      --src)
        SRCDIR="$(real_path $2)"
        shift # past argument
        shift # past value
        ;;
      --dst)
        DSTDIR="$(real_path $2)"
        shift # past argument
        shift # past value
        ;;
      *)    # unknown option
        shift # past argument
        ;;
    esac
  done


  if [[ -z "$DSTDIR" ]]; then
    echo "No destination dir provided"
    usage
    exit 1
  fi

  if [[ -z "$SRCDIR" ]]; then
    echo "No source dir provided"
    usage
    exit 1
  fi

  mkdir -p ${DSTDIR}

  echo $(date) : "=== Copying files"

  mkdir -p ${DSTDIR}/pydrake

  # copy pydrake subdirectory
  cp -r ${SRCDIR}/lib/python3.6/site-packages/pydrake ${DSTDIR}

  # copy setup.py
  cp setup.py ${DSTDIR}

  pushd .

  cd ${DSTDIR}

  echo $(date) : "=== Building wheel"

  python3 setup.py bdist_wheel

  popd
}

main "$@"