### kong 介绍
Kong(https://github.com/Kong/kong/ )是一个云原生，高效，可扩展的分布式 API 网关。 自 2015 年在 github 开源后，广泛受到关注，目前已收获 1.9w+ 的 star，其核心价值在于高性能和可扩展性。

这里主要讲如何用docker部署kong网关和postgreSql单点部署。

### 安装环境要求

1.安装docker
```sh
#centos 安装docker
$ sudo yum install -y yum-utils device-mapper-persistent-data lvm2
$ sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
$ sudo yum update
$ sudo yum install docker-ce

#ubuntu 安装docker
$ sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt update
$ sudo apt install docker-ce
```


2.安装docker-composer
```sh
#curl安装docker-compose
$ sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
#pip安装docker-compose
$ sudo pip install docker-compose
```

### 环境变量配置
在kong目录下
kong.env ---kong配置
```sh
KONG_DATABASE=postgres
KONG_PG_HOST=kong-database #数据库ip
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

### 部署步骤
```sh
$ git clone https://github.com/onebig32/dockerfile.git
$ cd dockerfile
$ chmod +x deploy.sh
$ ./deploy.sh
```

### 访问入口
根据docker-compose的yml文件都端口映射配置

kong Dashboard( Kong 管理页面):
http://本机IP:8008/#!/

pgadmin4(postgreSql管理页面):
http://本机IP:8009/login?next=%2F
