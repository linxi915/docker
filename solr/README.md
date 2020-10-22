# Solr

## 概述

基于 [bitnami/bitnami-docker-solr](https://github.com/bitnami/bitnami-docker-solr/) 进行修改。

主要修改如下:

* 修改apt-get使用163的软件源
* 安装的基础工具

	* curl git unzip vim 
	* kde-l10n-zhcn (中文包)

* 中国时区和中文语言环境。

参考构建命令

```
docker build -t kennylee/solr .
```

## 使用说明

1. solr默认根目录: `/opt/bitnami/solr/data` (同 `/opt/bitnami/solr/server/solr/`)，内核配置文件可放在这个目录下。 
2. 持久化数据: `/path/to/solr-persistence:/bitnami` 宿主机挂载镜像内的 `/bitnami` 目录后，容器内的solr数据目录会分离出去。
3. 若宿主机映射了 `/bitnami` 目录，可把内核文件拷贝到宿主机 `/path/to/solr-persistence/solr/data` 路径下。
