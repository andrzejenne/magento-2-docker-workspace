#!/bin/bash

service php7.4-fpm start

wait-for-db $DB_HOST $DB_PORT $DB_USER $DB_PASSWORD
if ! [ "$?" -eq "0" ]
then
  exit 1;
fi

wait-for $ELASTIC_HOST $ELASTIC_PORT
if ! [ "$?" -eq "0" ]
then
  exit 1;
fi

#php -S 0.0.0.0:80 -t ./pub/ ./phpserver/router.php

# fix access rights
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chown -R :www-data . # Ubuntu
chmod u+x bin/magento

echo "Spawning the Nginx"

nginx -g 'daemon off;'
