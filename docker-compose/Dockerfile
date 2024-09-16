FROM appku/waka:docker

#add packages
RUN apk update \
    && apk add --update --no-cache -q openssh-client gettext ca-certificates

#include scripts
COPY docker-compose-ops /waka/

CMD ["docker-compose-ops"]