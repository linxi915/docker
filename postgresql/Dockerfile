FROM postgres:10.1-alpine

MAINTAINER kennylee26 <kennylee26@gmail.com>

# 使用阿里云镜像
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# Install base packages
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add curl bash tzdata tar unzip && \ 
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo -ne "Alpine Linux 3.6 image. (`uname -rsv`)\n" >> /root/.built && \
    rm -fr /tmp/* /var/cache/apk/*

RUN mkdir -p /var/lib/postgresql/data
