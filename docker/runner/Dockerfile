FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq --fix-missing \
    && apt-get install -yqq --fix-missing dialog apt-utils libcurl4-openssl-dev libonig-dev libxml2 libxml2-dev libxslt1-dev \
         libpq-dev libssl-dev zlib1g-dev libpng-dev libzip-dev

RUN apt-get install -yqq --fix-missing php7.4-cli php7.4-common php7.4-curl php7.4-json php7.4-mbstring php7.4-mysql \
        php7.4-xml php7.4-xsl php7.4-gd php7.4-apcu php7.4-zip php7.4-http php7.4-sockets php7.4-intl \
        php7.4-soap php7.4-bcmath php7.4-fpm php7.4-xdebug mariadb-client nginx zip unzip gnupg curl sudo cron

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

COPY ./docker/runner/scripts/* /usr/local/bin/
COPY ./docker/runner/docker-entrypoint.sh /tmp/
COPY ./docker/runner/xdebug.ini /etc/php/7.4/mods-available/

EXPOSE 80

CMD ["/tmp/docker-entrypoint.sh"]
