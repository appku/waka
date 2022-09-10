FROM docker:20.10.17-cli-alpine3.16

#add packages
RUN apk add --update --no-cache -q openssh nano bash curl jq tar gzip

#ssh prep (ssh not installed)
RUN mv /root /waka \
    && mkdir -p /waka/.ssh \
    && chmod 700 /waka/.ssh \
    && touch /waka/.ssh/known_hosts \
    && chmod 644 /waka/.ssh/known_hosts

#include scripts
COPY assets /waka/

#ready workspace
ARG APPKU_WAKA_VERSION=1.0.0
ENV APPKU_WAKA_VERSION=${APPKU_WAKA_VERSION}
ENV PATH="${PATH}:/waka"
ENV HOME="/waka"
WORKDIR /waka

#set default shell to bash
SHELL ["/bin/bash", "-c"]