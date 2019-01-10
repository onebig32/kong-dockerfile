#! /bin/bash

# 1. 构建pgadmin4镜像
docker build  --no-cache --tag dpage/pgadmin4 .

# 2. 运行容器
docker run -d -p 8009:80 \
-d dpage/pgadmin4
