#!/bin/bash

set -e

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function build {
  VERSION=${2:+":$2"}
  IMAGE="fcomb/$1$VERSION"
  docker build ${BUILD_OPTS} --force-rm --no-cache -t ${IMAGE} ${ROOT}/$1
  docker push ${IMAGE}
}

time build "jdk8-sbt-alpine" "2.12"
time build "jre8-sbt-alpine" "2.12"
