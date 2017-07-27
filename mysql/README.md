# MySQL

### 说明

官方 https://hub.docker.com/_/mysql/

修改：

1. 修改默认mysql默认编码为utf-8
2. 可自行修改my.cnf
3. 去掉默认的 VOLUME /var/lib/mysql 方便备份。

### 构建命令 

* build

```
docker build -t kennylee26/mysql ./
```

## 主从同步

```
docker-compose -f docker-compose-replication.yml up --build -d
```

注意由于 `slave` 的数据库中的 `replication/slave-backup/schema.sql` 需要根据 `master` 的情况来修改，所以未必每次可用，可根据实际情况来修改。具体操作是登录 `master` 容器中的mysql控制台内，敲入 `SHOW MASTER STATUS;` 来查看。

提醒下，正式使用时，注意数据分离，`docker-compose-replication.yml` 例子中为了增加logbin准确度，所以没映射log目录出来。


