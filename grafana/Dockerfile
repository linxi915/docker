FROM grafana/grafana:8.0.0

MAINTAINER kennylee <kennylee26@gmail.com>

USER root

# 使用阿里云镜像
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# Install base packages
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add curl bash tzdata tar unzip && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo -ne "Alpine Linux 3.13 image. (`uname -rsv`)\n" >> /root/.built && \
    rm -fr /tmp/* /var/cache/apk/*

USER grafana

EXPOSE 3000

ENTRYPOINT [ "/run.sh" ]
