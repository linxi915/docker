nginx+ftp功能服务(本例用来上传gitbook的静态页面)

=====

在宿主机器执行以下命令，存放相关数据文件

```
mkdir -p /home/gitbook/html/
mkdir -p /home/gitbook/pure-ftpd/
chmod 777 -R /home/gitbook/
```

执行命令

```
docker-compose up -d
```

启动后先，ftp账号，参考下面命令

```
docker exec -it gitbook-ftp /bin/bash
pure-pw useradd ftp -u ftpuser -d /usr/share/nginx/html
pure-pw mkdb
```

重启服务，即可。

注意，ftp连接时不要选择被动模式！

--------

FTP配置信息，参见：http://download.pureftpd.org/pub/pure-ftpd/doc/README
