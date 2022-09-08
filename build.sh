#!/bin/sh

APPKU_WAKA_VERSION=1.0.1
docker build --build-arg APPKU_WAKA_VERSION=$APPKU_WAKA_VERSION . -t appku/waka:latest -t appku/waka:$APPKU_WAKA_VERSION