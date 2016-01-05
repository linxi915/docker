build

docker build -t kennylee26/mysql ./

-----

官方 https://hub.docker.com/_/mysql/

说明：
1、修改默认mysql默认编码为utf-8
2、可自行修改my.cnf
3、去掉默认的 VOLUME /var/lib/mysql 方便备份。
