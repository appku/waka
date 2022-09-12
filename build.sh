#!/bin/sh

# run in script location
cd $(dirname "$(realpath "$0")")
APPKU_WAKA_VERSION=$(head -1 ./VERSION)
if [[ -z "$1" || "$1" == "waka" || "$1" == "latest" ]]; then
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:latest -t appku/waka:$APPKU_WAKA_VERSION
fi
if [[ -z "$1" || "$1" == "deploy" ]]; then
    cd deploy
    docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:deploy -t appku/waka:deploy-$APPKU_WAKA_VERSION
fi