#! /bin/bash

# 1. 构建kong镜像
docker build  --no-cache --tag postgres:9.6 .

# 2. 运行容器
docker run -d --name kong-database \
               -p 5432:5432 \
               postgres:9.6
