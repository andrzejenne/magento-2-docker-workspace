#!/bin/bash
clean.sh

sudo -u www-data bin/magento setup:upgrade
#bin/magento setup:di:compile
