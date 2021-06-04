#!/bin/bash
rm -rf var/cache/* var/page_cache/* generated/*

sudo -u www-data bin/magento setup:upgrade
#bin/magento setup:di:compile
