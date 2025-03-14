#!/bin/bash -eu

# run in script location
cd $(dirname "$(realpath "$0")")
APPKU_WAKA_VERSION=$(head -1 ./VERSION)
TAG=${1:-}
if [[ -z "$TAG" || "$TAG" == "waka" || "$TAG" == "latest" ]]; then
    echo "Pushing AppKu™ Waka v$APPKU_WAKA_VERSION..."
    docker push appku/waka:latest
    docker push appku/waka:$APPKU_WAKA_VERSION
fi
if [[ -z "$TAG" || "$TAG" == "cloud-az" ]]; then
    echo "Pushing AppKu™ Waka :cloud-az v$APPKU_WAKA_VERSION..."
    docker push appku/waka:cloud-az
    docker push appku/waka:cloud-az-$APPKU_WAKA_VERSION
fi
if [[ -z "$TAG" || "$TAG" == "cloud-gcp" ]]; then
    echo "Pushing AppKu™ Waka :cloud-gcp v$APPKU_WAKA_VERSION..."
    docker push appku/waka:cloud-gcp
    docker push appku/waka:cloud-gcp-$APPKU_WAKA_VERSION
fi
if [[ -z "$TAG" || "$TAG" == "docker" ]]; then
    echo "Pushing AppKu™ Waka :docker v$APPKU_WAKA_VERSION..."
    docker push appku/waka:docker 
    docker push appku/waka:docker-$APPKU_WAKA_VERSION
fi
if [[ -z "$TAG" || "$TAG" == "docker-compose" ]]; then
    echo "Pushing AppKu™ Waka :docker-compose v$APPKU_WAKA_VERSION..."
    docker push appku/waka:docker-compose 
    docker push appku/waka:docker-compose-$APPKU_WAKA_VERSION
fi
if [[ -z "$TAG" || "$TAG" == "dotnet" ]]; then
    echo "Pushing AppKu™ Waka :dotnet v$APPKU_WAKA_VERSION..."
    docker push appku/waka:dotnet 
    docker push appku/waka:dotnet-$APPKU_WAKA_VERSION
fi
if [[ -z "$TAG" || "$TAG" == "node" ]]; then
    echo "Pushing AppKu™ Waka :node v$APPKU_WAKA_VERSION..."
    docker push appku/waka:node 
    docker push appku/waka:node-$APPKU_WAKA_VERSION
fi
if [[ -z "$TAG" || "$TAG" == "node-puppeteer" ]]; then
    echo "Pushing AppKu™ Waka :node-puppeteer v$APPKU_WAKA_VERSION..."
    docker push appku/waka:node-puppeteer 
    docker push appku/waka:node-puppeteer-$APPKU_WAKA_VERSION
fi