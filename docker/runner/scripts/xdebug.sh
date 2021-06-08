#!/bin/bash

if [[ "$1" == "stop" ]]
then
  echo "Disabling xdebug"
  phpdismod xdebug
else
  echo "Enabling xdebug"
  phpenmod xdebug
fi

service php7.4-fpm restart
