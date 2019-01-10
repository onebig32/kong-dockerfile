#! /bin/bash

# 1. 构建kong镜像
docker build  --no-cache --tag kong:0.14.1 .

# 2. 运行容器
docker run -d --name kong \
     -p 8000:8000 \
     -p 8443:8443 \
     -p 8001:8001 \
     -p 8444:8444 \
     kong:0.14.1
