### 安装环境要求

1.安装docker
```sh
#centos 安装docker
$ sudo yum install -y yum-utils device-mapper-persistent-data lvm2
$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
$ sudo yum update
$ sudo yum install docker-ce

#ubuntu 安装docker
$ sudo apt updatesudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
$ sudo apt updatecurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt updatesudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt update
$ sudo apt install docker-ce
```


2.安装docker-composer
```sh
$ sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

### 环境变量配置
在kong目录下
kong.env ---kong配置
```sh
KONG_DATABASE=postgres
KONG_PG_HOST=10.0.2.15 #postgre数据库IP
KONG_PROXY_ACCESS_LOG=/dev/stdout
KONG_ADMIN_ACCESS_LOG=/dev/stdout
KONG_PROXY_ERROR_LOG=/dev/stderr
KONG_ADMIN_ERROR_LOG=/dev/stderr
KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl
```

pgadmin4.env ---pgadmin4配置
```sh
PGADMIN_DEFAULT_EMAIL=admin@admin.com #pgadmin4账号
PGADMIN_DEFAULT_PASSWORD=admin #pgadmin4密码

```

postgres.env ---postgres配置
```sh
POSTGRES_USER=kong #数据库用户
POSTGRES_DB=kong #数据库名称
```

### 部署脚本
```sh
#! /bin/bash

# 1. 部署postgreSql数据库 和 pgdadmin
docker-compose -f docker-compose-postgres.yml up -d

# 2. 部署kong 和 dashboard
docker-compose -f docker-compose-kong.yml up -d
```

### 部署步骤
```sh
$ git clone https://github.com/onebig32/dockerfile.git
$ cd dockerfile
$ ./deploy.sh
```

