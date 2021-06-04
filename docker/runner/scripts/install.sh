#!/bin/bash

cd /var/www || exit 1

composer install

bin/magento setup:install \
  --base-url=http://localhost/ \
  --db-host=$DB_HOST \
  --db-name=$DB_NAME \
  --db-user=$DB_USER \
  --db-password="$DB_PASSWORD" \
  --backend-frontname=admin \
  --use-rewrites=1 \
  --elasticsearch-host=elastic \
  --cleanup-database


bin/magento admin:user:create \
  --admin-firstname="$ADMIN_FIRSTNAME" \
  --admin-lastname="$ADMIN_LASTNAME" \
  --admin-email="$ADMIN_EMAIL" \
  --admin-user="$ADMIN_USER" \
  --admin-password="$ADMIN_PASSWORD" \

refresh.sh

#bin/magento setup:di:compile
