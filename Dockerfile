FROM rockylinux/rockylinux:9-minimal

#set default shell to bash
SHELL ["/bin/bash", "-c"]

#docker enhancements
RUN echo "tsflags=nodocs" >> /etc/dnf/dnf.conf

#ssh prep (ssh not installed)
RUN mv /root /waka \
    && rm -f /waka/anaconda* /waka/original-ks.cfg \
    && mkdir -p /waka/.ssh \
    && chmod 700 /waka/.ssh \
    && touch /waka/.ssh/known_hosts \
    && chmod 644 /waka/.ssh/known_hosts

#update & install packages
RUN microdnf update -y \
    && microdnf install -y --nodocs \
        nano findutils iputils bind-utils jq tar gzip curl openssl openssh-clients nodejs \
    && microdnf clean all

#include scripts
COPY assets /waka/

#builds
RUN cd /waka/server && npm ci

#ready workspace
ARG APPKU_WAKA_VERSION=1.0.0
ENV APPKU_WAKA_VERSION=${APPKU_WAKA_VERSION}
ENV PATH="${PATH}:/waka"
ENV HOME="/waka"
WORKDIR /waka

CMD ["hello"]