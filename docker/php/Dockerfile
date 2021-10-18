FROM php:7.4-fpm-alpine

WORKDIR /var/www

COPY ./runner/scripts/* /usr/local/bin/
COPY ./runner/xdebug.ini /etc/php/7.4/mods-available/

