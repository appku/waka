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
        nano findutils iputils bind-utils jq tar gzip curl openssl openssh-clients tree gettext nodejs  \
    && microdnf clean all \
    #install rg
    && curl https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz -L -o /tmp/rg.tar.gz \
    && tar xzf /tmp/rg.tar.gz -C /tmp \
    && cp -R /tmp/ripgrep-* /usr/share/ripgrep \
    && ln -s /usr/share/ripgrep/rg /usr/bin/rg \
    #install yq
    && curl https://github.com/mikefarah/yq/releases/download/v4.27.5/yq_linux_amd64.tar.gz -L -o /tmp/yq.tar.gz \
    && tar xzf /tmp/yq.tar.gz -C /tmp/ \
    && cp -R /tmp/yq_linux_amd64 /usr/bin/yq \
    #cleanup
    && rm -fr /tmp/*

#update npm to latest
RUN npm install -g npm

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