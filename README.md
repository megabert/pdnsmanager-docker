# Docker Script for pdnsmanger

## General

This repository creates a docker container for an existing powerdns server. It creates the schema_extensions for your
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

- login to pdnsmanager at the ip of your host and port 9999 use the password configured in the .env file and the variables $PDNSMANAGER_ADMIN_USER $PDNSMANAGER_ADMIN_PASS

