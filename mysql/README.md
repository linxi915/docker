# MySQL

## 说明

官方 https://hub.docker.com/_/mysql/

修改：

1. 修改官网的my.cnf文件，配置编码为utf-8
2. 增加/etc/mysql/mysql-my.conf.d/的配置目录，方便启动容器的时候映射额外mysql的配置目录。
3. 去掉默认的 VOLUME /var/lib/mysql 方便备份。

### 自定义配置

1. 在宿主机上映射镜像内部的`/etc/mysql/mysql-my.conf.d/`目录，然后创建cnf文件，再把自定义的配置填写在里面。
2. 启动容器的时候，通过cmd的方法传入配置。  例如，最大连接数（可参考下docker-compose.yml）启动容器的时候传入`--max_connections=300`参数配置即可。


### 镜像下载

```
docker pull registry.cn-hangzhou.aliyuncs.com/kennylee/mysql
```

## 构建命令 

* build

```
docker build -t kennylee26/mysql ./
```

## MySQL主从同步（单向同步）实例

单向同步实现比较简单，双向就完全不同了，因为会涉及到事务和数据冲突等问题。一些读写分离和轻量级的高可用环境下课考虑使用。

```
docker-compose -f : up --build -d
```

注意由于 `slave` 的数据库中的 `replication/slave-backup/schema.sql` 需要根据 `master` 的情况来修改，所以未必每次可用，可根据实际情况来修改。具体操作是登录 `master` 容器中的mysql控制台内，敲入 `SHOW MASTER STATUS;` 来查看。

提醒下，正式使用时，注意数据分离，`docker-compose-replication.yml` 例子中为了增加logbin准确度，所以没映射log目录出来。

### 配置说明

#### master

```
# 服务器IP
bind-address	= 172.16.10.1
# 集群的server id 
server-id               = 1
# 同步依赖 log-bin 所以必须配置
log-bin = /var/log/mysql/mysql-bin.log
# 配置同步的数据库，多个写多行，不写全部都备份
binlog_do_db            = newdatabase
# 自动清理21天的日志
expire_logs_days = 21
```

配置好之后，还需要建立同步的账号，命令参考如下:

```
GRANT REPLICATION SLAVE ON *.* TO 'rep'@'%' IDENTIFIED BY '111111';
```

#### slave

```
server-id = 2
relay-log = /var/log/mysql/mysql-relay-bin.log
```

mysql控制台，配置master同步的配置信息注意 `MASTER_LOG_FILE` 和 `MASTER_LOG_POS`

```
CHANGE MASTER TO MASTER_HOST='172.16.10.1',MASTER_USER='rep', MASTER_PASSWORD='111111', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=  154;
```

详细见 `replication/slave-backup/schema.sql` 文件

