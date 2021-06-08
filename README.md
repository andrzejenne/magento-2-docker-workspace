# Magento 2 docker workspace

Nginx and php 7.4 for Magento 2.4

## Prerequisites

docker and docker-compose must be ready on your system.

## Quick start

Just run setup.sh and wait till it setups magento.

## How to: spawn another version of magento

First check system requirements for your version.

Edit copy runner do another location and edit

Update docker-compose.yml

Setup with ./setup.sh $version.

$verion can by tag or commit hash.

## Customizations

Feel free to copy docker-compose.yml.stub to docker-compose.yml and customize by your needs.

The runner dockerfile was tested on magento 2.4.2.

## Usage

Runs setup:upgrade 
```bash
docker-compose exec runner refresh.sh
```

Clears cache
```bash
docker-compose exec runner clean.sh
```

## xdebug

Enabled by default

To disable run
```bash
docker-compose exec runner xdebug.sh stop
```

To enable run
```bash
docker-compose exec runner xdebug.sh
```

