# Zipkin

## 概述

* [core](./core): 官方镜像 https://hub.docker.com/r/openzipkin/zipkin , 仅作为国内构建加速使用。
* [dependencies](./dependencies) 官网镜像 https://hub.docker.com/r/openzipkin/zipkin-dependencies, 仅作为国内构建加速使用。
* [storage/mysql](./storage/mysql)，自建构建镜像，原来官方镜像不支持持久化数据，不太好用，所以只好自己写了。see the  [schema DDL](https://github.com/openzipkin/zipkin/blob/master/zipkin-storage/mysql-v1/src/main/resources/mysql.sql)

## 参见

* [openzipkin/zipkin](https://github.com/openzipkin/zipkin/tree/master/docker)
* [docker-zipkin/docker-compose.yml](https://github.com/openzipkin-attic/docker-zipkin/blob/master/docker-compose.yml)

