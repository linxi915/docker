# Ubuntu
#
# Base Docker Image http://dockerfile.github.io/#/ubuntu
# Authoer: kennylee26

FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu:xenial

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y python3 python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
