# Magento 2 docker workspace

Nginx and php 7.4 for Magento 2.4

## Prerequisites

docker and docker-compose must be ready on your system.

## Quick start

Just run setup.sh and wait till it ends.

## Customizations

Feel free to copy docker-compose.yml.stub to docker-compose.yml and customize by your needs.

Runner dockerfile is prepared for magento

## Usage

Runs setup:upgrade 
```bash
docker-compose exec runner refresh.sh
```

Clears cache
```bash
docker-compose exec runner clean.sh
```
