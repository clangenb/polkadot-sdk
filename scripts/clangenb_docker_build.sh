#!/usr/bin/env sh

set -e


export ENGINE=docker

export ARTIFACTS_FOLDER=target/release
export OWNER=clangenb
export DOCKER_OWNER=clangenb
export IMAGE_NAME=polkadot
export TAGS=v1.21.1-patch2

export DOCKERFILE="docker/dockerfiles/polkadot/polkadot_injected.Dockerfile"
export BINARY="polkadot,polkadot-execute-worker,polkadot-prepare-worker"

./docker/scripts/build-injected.sh