FROM appku/waka

#repos
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc

#update & install packages
RUN curl -o /tmp/ms.rpm https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm \
    && rpm -ivh /tmp/ms.rpm
RUN microdnf install -y --nodocs azure-cli
