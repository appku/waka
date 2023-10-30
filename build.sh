#!/bin/bash -eu

# run in script location
cd $(dirname "$(realpath "$0")")
APPKU_WAKA_VERSION=$(head -1 ./VERSION)
TAG=${1:-}
if [[ -z "$TAG" || "$TAG" == "waka" || "$TAG" == "latest" ]]; then
    pushd latest
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:latest -t appku/waka:$APPKU_WAKA_VERSION
    popd
fi
if [[ -z "$TAG" || "$TAG" == "cloud-gcp" ]]; then
    pushd cloud-gcp
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:cloud-gcp -t appku/waka:cloud-gcp-$APPKU_WAKA_VERSION
    popd
fi
if [[ -z "$TAG" || "$TAG" == "docker" ]]; then
    pushd docker
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:docker -t appku/waka:docker-$APPKU_WAKA_VERSION
    popd
fi
if [[ -z "$TAG" || "$TAG" == "docker-compose" ]]; then
    pushd docker-compose
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:docker-compose -t appku/waka:docker-compose-$APPKU_WAKA_VERSION
    popd
fi
if [[ -z "$TAG" || "$TAG" == "dotnet" ]]; then
    pushd dotnet
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:dotnet -t appku/waka:dotnet-$APPKU_WAKA_VERSION
    popd
fi
if [[ -z "$TAG" || "$TAG" == "node" ]]; then
    pushd node
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:node -t appku/waka:node-$APPKU_WAKA_VERSION
    popd
fi