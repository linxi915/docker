# Nginx+Ftp

实现用户通过ftp上传html文件，然后在浏览器上查看的需求；

ftp镜像基于 [stilliard/pure-ftpd](https://hub.docker.com/r/stilliard/pure-ftpd)

## 使用

> 注：如果想客户端支持`被动模式`，请修改`.env`配置文件中的`PUBLICHOST`变量；

1. 启动容器镜像

	执行命令

	```
	docker-compose up -d
	```

2. Ftp配置

	```
	username: ftp
	password: ftp
	```

3. Nginx

	默认是不开放文档列表功能，如果目录中没索引文件(index.html)，会报 `403 Forbidden`；

--------

FTP配置信息，参见：http://download.pureftpd.org/pub/pure-ftpd/doc/README


