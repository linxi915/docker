# Jenkins
#
# VERSION 0.0.1
# Authoer: kennylee26
# NAME: kennylee26/jenkins
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM jenkins:2.60.3

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

ARG user=jenkins
ARG http_port=8080
ARG agent_port=50000

VOLUME /var/jenkins_home

USER root

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY stretch.sources.list /etc/apt/sources.list

RUN apt-get -y update
# recommend
RUN apt-get install -y \
      curl git unzip vim wget
# this image required
RUN apt-get install -y ant
# clean
RUN rm -rf /var/lib/apt/lists/*

USER ${user}

# from a derived Dockerfile, can use `RUN plugins.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
