FROM registry.cn-hangzhou.aliyuncs.com/kennylee/mysql:5.7

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

COPY master-1.cnf /etc/mysql/conf.d/
COPY schema.sql /docker-entrypoint-initdb.d/schema.sql

EXPOSE 3306
CMD ["mysqld"]
