FROM appku/waka:docker

#add packages
RUN apk add --update --no-cache -q openssh

#include scripts
COPY docker-compose-ops /waka/

CMD ["docker-compose-ops"]