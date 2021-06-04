#!/bin/bash

cd /var/www

composer install

bin/magento setup:install --base-url=http://localhost/ \
--db-host=db \
--db-name=magento \
--db-user=magento \
--db-password=lopata \
--backend-frontname=admin \
--use-rewrites=1 \
--elasticsearch-host=elastic \
--cleanup-database

refresh.sh

#bin/magento setup:di:compile
