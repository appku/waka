FROM appku/waka

#run dotnet 3.1 & dotnet-script
# disable dotnet telemetry
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
RUN microdnf install -y libicu krb5-workstation \
    && curl "https://dot.net/v1/dotnet-install.sh" -LO \
    && chmod a+x dotnet-install.sh \
    && ./dotnet-install.sh -c 6.0 --install-dir /usr/share/dotnet \
    && rm dotnet-install.sh
ENV PATH=/usr/share/dotnet:/root/.dotnet/tools:$PATH
RUN dotnet tool install -g dotnet-script

#ready workspace
ARG APPKU_WAKA_VERSION=1.0.0
ENV APPKU_WAKA_VERSION=${APPKU_WAKA_VERSION}
ENV PATH="${PATH}:/waka:/waka/.dotnet/tools"
ENV HOME="/waka"
WORKDIR /waka

#set default shell to bash
SHELL ["/bin/bash", "-c"]