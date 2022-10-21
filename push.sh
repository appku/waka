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
if [[ -z "$1" || "$1" == "dotnet" ]]; then
    echo "Pushing AppKu™ Waka :dotnet v$APPKU_WAKA_VERSION..."
    docker push appku/waka:dotnet 
    docker push appku/waka:dotnet-$APPKU_WAKA_VERSION
fi
if [[ -z "$1" || "$1" == "housekeeping" ]]; then
    echo "Pushing AppKu™ Waka :housekeeping v$APPKU_WAKA_VERSION..."
    docker push appku/waka:housekeeping 
    docker push appku/waka:housekeeping-$APPKU_WAKA_VERSION
fi
if [[ -z "$1" || "$1" == "node" ]]; then
    echo "Pushing AppKu™ Waka :node v$APPKU_WAKA_VERSION..."
    docker push appku/waka:node 
    docker push appku/waka:node-$APPKU_WAKA_VERSION
fi
if [[ -z "$1" || "$1" == "notify" ]]; then
    echo "Pushing AppKu™ Waka :notify v$APPKU_WAKA_VERSION..."
    docker push appku/waka:notify 
    docker push appku/waka:notify-$APPKU_WAKA_VERSION
fi