FROM php:7.2.1-fpm-alpine3.7

RUN set -xe; \
    apk add --no-cache --virtual .fetch-deps $PHPIZE_DEPS; \
    pecl install xdebug-2.7.0; \
    docker-php-ext-enable xdebug; \
    apk del --no-network .fetch-deps

RUN apk add --no-cache make

COPY conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
