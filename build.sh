#!/bin/sh

APPKU_WAKA_VERSION=1.0.1

# run in script location
cd $(dirname "$(realpath "$0")")
docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:latest -t appku/waka:$APPKU_WAKA_VERSION
cd deploy
docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:deploy -t appku/waka:deploy-$APPKU_WAKA_VERSION