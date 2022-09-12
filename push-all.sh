#!/bin/sh

# run in script location
cd $(dirname "$(realpath "$0")")
APPKU_WAKA_VERSION=$(head -1 ./VERSION)
if [[ -z "$1" || "$1" == "waka" || "$1" == "latest" ]]; then
    echo "Pushing AppKu™ Waka v$APPKU_WAKA_VERSION..."
    docker push appku/waka:latest
    docker push appku/waka:$APPKU_WAKA_VERSION
fi
if [[ -z "$1" || "$1" == "deploy" ]]; then
    echo "Pushing AppKu™ Waka :deploy v$APPKU_WAKA_VERSION..."
    docker push appku/waka:deploy 
    docker push appku/waka:deploy-$APPKU_WAKA_VERSION
fi