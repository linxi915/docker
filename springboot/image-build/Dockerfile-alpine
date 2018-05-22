FROM registry.cn-hangzhou.aliyuncs.com/kennylee/java:alpine-oraclejava-jre8u121b13

MAINTAINER kennylee26 <kennylee26@gmail.com>

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT "/entrypoint.sh"
