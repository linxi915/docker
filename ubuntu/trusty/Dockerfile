# Ubuntu
#
# Base Docker Image http://dockerfile.github.io/#/ubuntu
# Authoer: kennylee26

FROM ubuntu:trusty

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list

# Set environment variables.
ENV HOME /root
ENV LANG="zh_CN.UTF-8" \
    LANGUAGE="zh_CN:zh:en_US:en" \
    LC_ALL="zh_CN.UTF-8" \
    TZ="Asia/Shanghai" \
    DEBIAN_FRONTEND="noninteractive" \
    TERM="xterm"

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y curl git unzip vim gnupg wget iputils-ping && \
  apt-get install -y language-pack-zh-hans && \ 
  apt-get install -y dialog apt-utils tzdata && \  
  rm -rf /var/lib/apt/lists/*

RUN locale

RUN echo $TZ  > /etc/timezone && \
        dpkg-reconfigure --frontend noninteractive tzdata

# Define working directory.
WORKDIR $HOME

# Define default command.
CMD ["bash"]
