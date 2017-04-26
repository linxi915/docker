# Ubuntu
#
# Base Docker Image http://dockerfile.github.io/#/ubuntu
# Authoer: kennylee26

FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu

MAINTAINER kennylee26 <kennylee26@gmail.com>

# Install.
RUN \
  apt-get update && \
  apt-get install -y inetutils-ping net-tools dnsutils supervisor && \
  rm -rf /var/lib/apt/lists/*

COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define default command.
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
