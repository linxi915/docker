# PostgreSQL

## 概述

基于 [bitnami-docker-postgresql](https://github.com/bitnami/bitnami-docker-postgresql) 进行修改。

主要修改如下:

* 修改apt-get使用163的软件源
* 安装的基础工具

	* curl git unzip vim 
	* kde-l10n-zhcn (中文包)

* 中国时区和中文语言环境。

参考构建命令

```
docker build -t kennylee/postgresql .
```

see also: https://hub.docker.com/r/bitnami/postgresql

## 自定义配置文件

### 挂载配置目录

1. 挂载 `/bitnami/postgresql/conf/` 目录。
2. 启动容器（此时挂载的目录为空目录）。
3. 拷贝自定义的postgresql.conf文件到上述挂载的本地目录中。
4. 重启容器。

### 挂载配置文件

在如k8s环境下，挂载配置文件方式会更加灵活。

映射到 `/bitnami/postgresql/conf/postgresql.conf` 即可