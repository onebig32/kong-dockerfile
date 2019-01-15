#! /bin/bash

# 1. 准备环境网络
docker network create kong-net

# 2. 准备数据存储卷
docker volume create pgdata

# 3. 构建镜像
docker-compose build

# 4. 初始化数据库
docker-compose run kong kong migrations up

# 5. 通过docker-compose运行环境
docker-compose up -d --no-recreate