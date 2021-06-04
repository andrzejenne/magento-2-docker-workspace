#!/bin/bash

#SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

git clone git@github.com:magento/magento2.git magento2-src && \
    cd magento2-src && \
    git checkout 2.4.2-p1 && \
    cd .. && \
    docker-compose up && \
    docker-compose exec runner install.sh







