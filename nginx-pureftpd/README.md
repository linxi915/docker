# Nginx+Ftp

实现用户通过ftp上传html文件，然后在浏览器上查看的需求；

ftp镜像基于 [stilliard/pure-ftpd](https://hub.docker.com/r/stilliard/pure-ftpd)

## 使用

1. 启动容器镜像

	执行命令

	```
	docker-compose up -d
	```

2. Ftp配置

	```
	# 进入ftp容器
	docker exec -it ftpd_server /bin/bash
	# 创建ftp用户，并且制定根目录
	pure-pw useradd ftp -u ftpuser -d /usr/share/nginx/html
	# 创建库
	pure-pw mkdb
	```

	其中，用户名为 `ftp` ，密码输入后，重启服务
	
	```
	docker restart ftpd_server
	```

	> 注：实测对ftp客户端兼容性不太好，并且连接时不要选择被动模式！

3. Nginx

	默认是不开放文档列表功能，如果目录中没索引文件(index.html)，会报 `403 Forbidden`；

--------

FTP配置信息，参见：http://download.pureftpd.org/pub/pure-ftpd/doc/README


