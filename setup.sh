#!/bin/bash

DEFAULT_VERSION="2.4.3"
VERSION="$1"

if [ -z "$VERSION" ]
then
  VERSION="$DEFAULT_VERSION"
fi

if ! [ -f docker-compose.yml ]
then
  cp docker-compose.yml.stub docker-compose.yml
fi

if ! [ -d magento2-src ]
then
  git clone git@github.com:magento/magento2.git magento2-src
fi

cd magento2-src || exit 1;

git checkout "$VERSION" && cd .. && \
docker-compose up -d && WAIT_TIMEOUT=300 ./docker/runner/scripts/wait-for localhost 80 && \
docker-compose exec runner install.sh
