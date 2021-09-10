#!/bin/bash
clean.sh

sudo -u www-data bin/magento setup:db-schema:upgrade
sudo -u www-data bin/magento setup:upgrade
sudo -u www-data bin/magento indexer:reindex
#bin/magento setup:di:compile
