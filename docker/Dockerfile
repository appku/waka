FROM docker:29.0.1-dind-alpine3.22

#add packages
RUN apk add --update --no-cache -q nano bash curl jq yq tar gzip tree ripgrep

#ssh prep (ssh not installed)
RUN mv /root /waka \
    && sed -i 's|/root|/waka|g' /etc/passwd \
    && mkdir -p /waka/.ssh \
    && chmod 700 /waka/.ssh \
    && touch /waka/.ssh/known_hosts \
    && chmod 644 /waka/.ssh/known_hosts

#include scripts
COPY docker-ops /waka/

#ready workspace
ARG APPKU_WAKA_VERSION=1.1.0
ENV APPKU_WAKA_VERSION=${APPKU_WAKA_VERSION}
ENV PATH="${PATH}:/waka"
ENV HOME="/waka"
WORKDIR /waka

#set default shell to bash
SHELL ["/bin/bash", "-c"]
CMD ["docker-ops"]
