FROM mochrira/php:8-apache

RUN sudo apk update \
    && sudo apk add --no-cache nodejs npm

COPY entrypoint.sh /entrypoint.sh

USER php
WORKDIR /var/www/html
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]