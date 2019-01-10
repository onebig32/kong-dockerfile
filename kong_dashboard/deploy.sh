#! /bin/bash
# 1. 构建镜像
docker build  --no-cache --tag pgbi/kong-dashboard .
# 2. 运行kong-dashboard容器
docker run -d \
--name kong-dashboard -p 8008:8080 pgbi/kong-dashboard \
--kong-url http://10.0.2.15:8001 \
--basic-auth admin=admin
