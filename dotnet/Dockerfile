FROM appku/waka

#run dotnet 3.1 & dotnet-script
# disable dotnet telemetry
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
RUN microdnf install -y libicu krb5-workstation \
    && curl "https://dot.net/v1/dotnet-install.sh" -LO \
    && chmod a+x dotnet-install.sh \
    && ./dotnet-install.sh -c 6.0 --install-dir /usr/share/dotnet \
    && rm dotnet-install.sh
ENV PATH=/usr/share/dotnet:/waka/.dotnet/tools:$PATH
RUN dotnet tool install -g dotnet-script

COPY scmp-deploy scmp-deploy.csx /waka/

CMD ["dotnet", "build", "--nologo"]