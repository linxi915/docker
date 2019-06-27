# ftp镜像-使用pureftp

## 说明

基于 [stilliard/pure-ftpd](https://github.com/stilliard/docker-pure-ftpd) 镜像；

docker-compose启动后，默认ftp用户信息:

```
username: ftp
password: ftp
```

> 注：如果想客户端支持`被动模式`，注意启动镜像的时候配置 `PUBLICHOST` 环境变量；

### pure-ftpd配置说明

常用配置

| 参数 | 说明 |
| --- | --- |
| -c  --maxclientsnumber | 最大连接数；注意端口数量；<br />最大连接数＝（最大＋1 －最小）/ 2；<br />如果端口太少，最大连接数也是无用的；|
| -C  --maxclientsperip | 每个ip连接数量 |
| -d  --verboselog | 记录日志 |
| -e  --anonymousonly | 仅支持匿名登录访问 | 
| -E  --noanonymous | 不允许匿名用户连接 |
| -j  --createhomedir | 如果虚拟用户的目录不存在则自动创建 |
| -R  --nochmod | 不接受 CHMOD 命令。用户不能更改他们文件的属性。 |
| -P  --forcepassiveip <ip address> | 强制指定返回IP，被动模式下好用；<br />不然会返回内网IP给客户端，客户端可能不能访问；<br />这是可以手动指定外网IP； |
| -l  --login | 用户验证数据文件 |
| -p  --passiveportrange | 被动模式端口范围 |
| -9  --clientcharset | 默认编码 |
| -x  --prohibitdotfileswrite | 不能删除/写入隐藏文件 |

详见：http://download.pureftpd.org/pub/pure-ftpd/doc/README

## 镜像版本

镜像内已不内置创建用户，请启动镜像的时候传入FTP_USER_NAME等变量，具体参见[stilliard/pure-ftpd](https://github.com/stilliard/docker-pure-ftpd) 

* latest: 基于stilliard/pure-ftpd的镜像，修改本地源，安装基础软件和本地时区设置；


