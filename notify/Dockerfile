FROM appku/waka

#include scripts
COPY assets /waka/
RUN mkdir -p /opt/resource \
    && ln -s /waka/check /opt/resource/check \
    && ln -s /waka/in /opt/resource/in \
    && ln -s /waka/out /opt/resource/out

#ready workspace
ARG APPKU_WAKA_VERSION=1.0.0
ENV APPKU_WAKA_VERSION=${APPKU_WAKA_VERSION}
ENV PATH="${PATH}:/waka"
ENV HOME="/waka"
WORKDIR /waka

#set default shell to bash
SHELL ["/bin/bash", "-c"]