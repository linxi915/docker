# Gradle+Node

Maven+Gradle+Node的环境，maven源已配置使用阿里云镜像，Node配置淘宝镜像。

前后端分离环境，适应java+vue等前后端都需要构建的环境。

## 容器内的一些配置

Gradle本地库 `/home/gradle/.gradle`
Maven本地仓库挂载 `/var/maven/repository`

## 参考

* [openjdk](https://github.com/docker-library/openjdk)
* [docker-maven](https://github.com/carlossg/docker-maven)
* [docker-gradle](https://github.com/keeganwitt/docker-gradle)
* [docker-node](https://github.com/nodejs/docker-node/)
* [alpine-node](https://github.com/mhart/alpine-node)


