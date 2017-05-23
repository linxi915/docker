Docker NFS Server
================

fork for [cpuguy83/docker-nfs-server](https://github.com/cpuguy83/docker-nfs-server)

Test
---
```bash
# 启动 nfs-server
docker-compose up -d
# 查看nfs-server的ip
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  nfs-server
# 创建，并且进入centos容器，连接nfs_default网络
docker run -it --network="nfs_nfs" --privileged --rm registry.cn-hangzhou.aliyuncs.com/kennylee/centos:7 bash
yum makecache && yum install -y showmount nfs-utils
rpcbind start
showmount -e 172.20.0.2
```

正常的话，会看到下面信息

>[root@d9febac7e894 ~]# showmount -e 172.24.0.2
>Export list for 172.24.0.2:
>/tmp *

```
# 挂载
mkdir -p /usr/local/test
mount -t nfs4 172.20.0.2:/tmp/ /usr/local/test
```

Usage
----
```bash
docker run -d --name nfs --privileged cpuguy83/nfs-server /path/to/share /path/to/share2 /path/to/shareN


docker run -d --name nfs --privileged cpuguy83/nfs-server /path/to/share /path/to/share2 /path/to/shareN
```

```bash
docker run -d --name nfs-client --privileged --link nfs:nfs cpuguy83/nfs-client /path/on/nfs/server:/path/on/client
``` 

More Info
=========

See [docker-quicktip-4-remote-volumes](./2014-03-29-docker-quicktip-4-remote-volumes.md)


