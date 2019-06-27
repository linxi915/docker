# Pure ftp-Server
#
# VERSION 0.0.1
# Base image: https://github.com/stilliard/docker-pure-ftpd
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/pure-ftpd:stretch-without-user

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

#add base user info
COPY run.sh /run.sh
RUN chmod +x /*.sh

# Define default command.
EXPOSE 21/tcp 30000-30009

CMD ["/run.sh"]
