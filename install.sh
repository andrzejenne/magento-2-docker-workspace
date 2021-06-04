#!/bin/bash

composer update

bin/magento setup:install --base-url=http://localhost/ \
--db-host=db \
--db-name=magento \
--db-user=magento \
--db-password=lopata \
--backend-frontname=admin \
--use-rewrites=1 \
--elasticsearch-host=elastic \
--cleanup-database

rm -rf cache/* page_cache/* generated/*

bin/magento setup:upgrade
#bin/magento setup:di:compile
