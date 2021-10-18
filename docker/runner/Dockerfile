FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

ARG PHP_VER=7.4

RUN apt-get update -yqq --fix-missing \
    && apt-get install -yqq --fix-missing dialog apt-utils libcurl4-openssl-dev libonig-dev libxml2 libxml2-dev libxslt1-dev \
         libpq-dev libssl-dev zlib1g-dev libpng-dev libzip-dev

RUN apt-get install -yqq --fix-missing php$PHP_VER-cli php$PHP_VER-common php$PHP_VER-curl php$PHP_VER-json php$PHP_VER-mbstring php$PHP_VER-mysql \
        php$PHP_VER-xml php$PHP_VER-xsl php$PHP_VER-gd php$PHP_VER-apcu php$PHP_VER-zip php$PHP_VER-http php$PHP_VER-sockets php$PHP_VER-intl \
        php$PHP_VER-soap php$PHP_VER-bcmath php$PHP_VER-fpm php$PHP_VER-xdebug mariadb-client nginx zip unzip gnupg curl sudo cron

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

COPY ./docker/runner/scripts/* /usr/local/bin/
COPY ./docker/runner/docker-entrypoint.sh /tmp/
COPY ./docker/runner/xdebug.ini /etc/php/$PHP_VER/mods-available/

EXPOSE 80

CMD ["/tmp/docker-entrypoint.sh"]
