# Jenkins
#
# VERSION 0.0.1
# Authoer: kennylee26
# NAME: kennylee26/jenkins
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM kennylee26/ubuntu

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
RUN echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list

RUN echo nameserver 8.8.8.8>>/etc/resolv.conf

RUN apt-get update && \
    apt-get -y install jenkins

RUN rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /root

EXPOSE 8080

ADD run.sh /run.sh
RUN chmod +x /*.sh
# Define default command.
CMD ["/run.sh"]
