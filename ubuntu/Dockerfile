# Ubuntu
#
# VERSION 0.0.1
# Base Docker Image http://dockerfile.github.io/#/ubuntu
# Authoer: kennylee26
# NAME: kennylee26/ubuntu
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM ubuntu:14.04

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
