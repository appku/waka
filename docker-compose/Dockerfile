FROM appku/waka:docker

#add packages
RUN apk add --update --no-cache -q openssh \
    && rm build-push

#include scripts
COPY deploy /waka/

CMD ["deploy"]