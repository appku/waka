# AppKu™ Waka
The official AppKu worker docker image. This image contains scripts and tooling that can be used by automated processes
to perform common CI/CD operations, such as tools/CLIs for git, ssh, docker, and cloud environments. The images also 
acts as a basic web application placeholder, spinning up to render a simple "Hello World" web app on port `:8080`.

The `appku/waka` is based on the `rockylinux/rockylinux:9-minimal` docker images, except for `docker-*` tags which, at
this time, use the `docker:24.0.2-dind-alpine3.18` as a base. The default working directory in `appku/waka` images is 
always: `/waka/`

## Contribution
This repository is officially supported by [appku](https://appku.com) and welcomes contributions from outside sources
to improve the project.

## Tags
Tags are used to indicate the variant of the default `appku/waka` image. Each is tailored to a typical CI/CD use-case.
All tags have a versioned variant (`<tag>-version`).

### `appku/waka` (`:latest`)
The default tag is `:latest` (and `:version`).
This tag is designated to act as both a placeholder, and for general scripted (bash/sh) automation, testing and 
development and includes the basics and scripts for those purposes.

**Example**
```sh
#this command will output a hello message to STDOUT then exit.
docker run -it appku/waka hello print

#this runs a placeholder website served on port http://localhost:8080
#using `-it` arguments will let you cleanly exit the container with CTRL+C.
docker run -it -p 8080:8080 appku/waka

#start an interactive bash shell.
docker run -it appku/waka bash

#run an exectable in the container
docker run -it appku/waka /some/path/and/command

#run a string command through bash.
docker run -it appku/waka bash -ce "echo 'test'"
```

By default the `:latest` tag will execute the `hello` script which...
- `hello`: Starts and runs a web server on port 8080 with a simple hello message.
- `hello print`: Outputs a simple hello message to stdout.

### `appku/waka:cloud-gcp`
This image provides addtiontal tooling and the official [Google Cloud CLI](https://cloud.google.com/sdk/gcloud) on
top of the existing `appku/waka` image.

### `appku/waka:docker`
This image builds and pushes a `Dockerfile` and provides access to Docker-in-Docker (DIND) using the base
`docker:24.0.2-dind-alpine3.18` image. It will automatically tag the image as `:latest` and with a semver (version)
detected from an optional `package.json` in the same location as the `Dockerfile`. You can optionally override the 
tags with an `IMAGE_TAG` ENV variable.

#### Required ENV Variables
- `IMAGE`    
  The name of the image to build (without the tag).
  **Example:**: `appku/waka`.

#### Optional ENV Variables
- `DOCKER_REGISTRY`   
  Specifies a docker registry to login to. By default this will be [dockerhub](https://hub.docker.com/).
  **Example**: `registry-1.docker.io`
- `DOCKER_REGISTRY_CA_PEM`    
  The certificate authority (CA) certificate in PEM format.
- `DOCKER_REGISTRY_PASSWORD`    
  If your docker registry requires basic authentication, you'll need to specify the password. This should be provided
  in tandem with `DOCKER_REGISTRY_USER` to perform a `docker login` to the remote host registry 
  (`DOCKER_REGISTRY`). 
- `DOCKER_REGISTRY_USER`   
  The docker registry username used to login.
- `IMAGE_TAG`   
  Specifies the built docker image's tag. Overriding the default of `:latest` and a detected semver tag (from a
  `package.json` file).    
  **Example**: `my-tag`

### `appku/waka:docker-compose`
This image deploys a docker compose service using Docker-in-Docker (DIND) with the base `docker:24.0.2-dind-alpine3.18`
image. It provides a default command `deploy` to connect to a remote docker host and deploy a docker compose file. 

The `deploy` command expects the following environmental variables in order to remotely deploy the docker-compose
service. It is good practice to set your docker-compose `service` name to avoid collisions with other services on the
remote docker host. You can find an example docker-compose file in the `docker-compose/` directory in this repo.

#### Required ENV Variables
- `REMOTE_DOCKER_HOST`    
  The remote host SSH fully-qualified domain name (FQDN).   
  **Example**: `host.some.domain`
- `REMOTE_DOCKER_HOST_SSH_KEY`    
  The private SSH key used to connect and authenticate with the remote host.
- `REMOTE_DOCKER_HOST_SSH_USER`    
  The username of the SSH user on the remote host.

#### Optional ENV Variables 
- `DOCKER_REGISTRY`   
  Specifies a docker registry to login to. By default this will be the `REMOTE_DOCKER` value.    
  **Example**: `registry-1.docker.io`
- `DOCKER_REGISTRY_CA_PEM`    
  The certificate authority (CA) certificate in PEM format.
- `DOCKER_REGISTRY_PASSWORD`    
  If your docker compose pulls images from a registry that requires basic authentication, you'll need to
  specify the password. This should be provided in tandem with `DOCKER_REGISTRY_USER` to perform a `docker login`
  to the remote host registry (`DOCKER_REGISTRY`). 
- `DOCKER_REGISTRY_USER`   
  The docker registry username (if needed). If you are pulling images in your docker compose service from
  public repositories you do not need to specify a username or password.
- `REMOTE_DOCKER_HOST_SSH_PORT`    
  An optional override of the SSH port for the remote host. Defaults to `22`.    
  **Example**: `2211`

### `appku/waka:dotnet`
This image provides [Microsoft's .Net Core](https://dotnet.microsoft.com/en-us/) and the 
[`dotnet-script`](https://github.com/dotnet-script/dotnet-script) command. 
It builds on top of the existing `appku/waka` image but overrides the default command to instead run `dotnet build`.

The default command assumes there is a dotnet project located in the default working directory (`/waka/`).

### `appku/waka:node`
This image provides [NodeJS](https://nodejs.org/en). It builds on top of the existing `appku/waka` image 
but overrides the default command to instead run `node install`.

The default command assumes there is a node project located in the default working directory (`/waka/`).