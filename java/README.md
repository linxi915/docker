# Java

各种Java运行环境，有JDK或者JRE。

参考 https://github.com/dockerfile/java

## 环境描述

* 安装一些常用的工具curl git unzip vim wget
* 中国时区设置。
* 配置了基本的 `JAVA_HOME` 与 `JAVA_OPTS` 。
* 除了 `apline` 标识的镜像版本，都采取中文语言环境。因为使用 `apline` 的用意就是轻便，无所谓的语言包了，毕竟语言包的体积不小！

## 版本说明

* openjdk -  建议使用此版本，后续更新比较简单；
* server-jre - 本来是理想版本，但构建时curl方式从oracle下载包很多时候都失败。（通常下载时候需要登录oracle的account才能下载，脚本里面使用的是命令）所以当前使用 `server-jre` 的镜像基本都是使用别人已经构建好的镜像环境（版本更新没保证）。



