FROM appku/waka

#repos
RUN rpm --import \
    https://packages.microsoft.com/keys/microsoft.asc \
    https://packages.cloud.google.com/yum/doc/yum-key.gpg \
    https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
RUN echo -e "\
[google-cloud-sdk]\n\
name=Google Cloud SDK\n\
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64\n\
enabled=1\n\
gpgcheck=0\n\
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg\n\
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg\
" > /etc/yum.repos.d/google-cloud-sdk.repo

#update & install packages
RUN microdnf install -y --nodocs \
    google-cloud-sdk \
    libicu openssl unzip jq python \
    wget curl openssh git-core unzip make
