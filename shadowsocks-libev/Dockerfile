# shadowsocks-libev
# NAME: kennylee26/shadowsocks-libev

# Pull base image.
FROM ubuntu:14.04

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

# resp
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list

# Basic Requirements
ADD 1D27208A.gpg /tmp/
RUN apt-key add /tmp/1D27208A.gpg
RUN echo 'deb http://shadowsocks.org/ubuntu trusty main'>/etc/apt/sources.list.d/shadowsocks.list

RUN apt-get update  && \
    apt-get install -y shadowsocks-libev --no-install-recommends

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define default command.
ENTRYPOINT ["/usr/bin/ss-server"]
