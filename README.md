# Docker Script for pdnsmanger

## General

This repository creates a docker container for an existing powerdns server for the [pdnsmanager gui](https://github.com/loewexy/pdnsmanager). It creates the schema_extensions for your
existing powerdns database. Have good backups if you plan to apply it at your existing powerdns database. Use at your
own risk.

## Requirements

- docker
- docker-compose

## Installation

- Backup your PowerDNS-Database
- clone this repository 

```git clone https://github.com/megabert/pdnsmanager-docker```

- Run prebuild script for downloading pdns-manager

```./prebuild.sh```

- Check .env.sh and fill in your database credentials
- create the docker-container 

```
docker-compose build
docker-compose up -d
```

- check the docker logs

```
docker logs pdnsmanager
```

- check if the container is running

```
docker ps
```

- login to pdnsmanager at the ip of your Host and Port 9999, use the credentials configured in the .env file with the variables $PDNSMANAGER_ADMIN_USER and $PDNSMANAGER_ADMIN_PASS

