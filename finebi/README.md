# FineBI

https://www.finebi.com/

FineBI是新一代自助式BI工具...略

启动后访问 http://localhost:8080/webroot/decision

## 镜像构建

由于FineBI官方提供安装的特殊性，不能在Dockerfile完成安装。*因为应用中使用到的一些数据直接存储到应用目录下，如果覆盖应用就会直接把应用初始化。*

目前采取方式是，手动执行官网安装包后，压缩webroot目录再打包到镜像内进行使用。

PS: `webroot.zip`过大，不提交上去了。更新的时候，若没特殊安装变动，只要替换这个文件即可。

## 端口

* `8080`: http端口
* `48888`: websocket端口

## 持久化数据

* 部署文件目录：`/opt/tomcat/webapps`
* 数据目录: `/var/findbi/data/`，可以把数据准备的数据存放在 `/var/findbi/data/business_package`，注意不能直接放在`/var/findbi/data/`，因为是外置目录，程序有执行删除的操作，有冲突。

**根据目前了解（毕竟只是作为一个部署者，而没有其他详细说明），有些FineBI在运行时产生的数据文件会默认存到执行目录（webapps），所以持久化时只能整个目录存储。**