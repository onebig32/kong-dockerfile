#! /bin/bash

# 1. 部署postgreSql数据库 和 pgdadmin
docker-compose -f docker-compose-postgres.yml up -d

# 2. 部署kong 和 dashboard
docker-compose -f docker-compose-kong.yml up -d
