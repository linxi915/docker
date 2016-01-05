ftp镜像-使用pureftp

=====

默认ftp用户信息:

```
username: ftp
password: ftp
```

详细参见 Dockerfile 文件

数据目录默认是 ```/home/ftpusers``` 和 ```/etc/pure-ftpd``` ，前者是ftp用户的基础目录，后者是ftp的配置文件目录。

命令参考

* build  
	docker build -t kennylee26/pureftpd .
* run  
	docker run -d --name=pureftpd -p 21:21 -p 30000-30009:30000-30009 kennylee26/pureftpd
	
注意事项:

1. ftp连接时最好不要选择被动模式！

--------

FTP配置信息，参见：http://download.pureftpd.org/pub/pure-ftpd/doc/README
