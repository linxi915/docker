# Http Proxy
#
# see also https://github.com/nginxinc/docker-nginx
# Authoer: kennylee26
# NAME: kennylee26/httpproxy
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM registry.alauda.cn/kenny/docker-nginx

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV EGINX_HOME=/etc/nginx

RUN echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib\n\
    deb http://mirrors.163.com/debian/ jessie-updates main non-free contrib\n\
    deb http://mirrors.163.com/debian/ jessie-backports main non-free contrib\n\
    deb-src http://mirrors.163.com/debian/ jessie main non-free contrib\n\
    deb-src http://mirrors.163.com/debian/ jessie-updates main non-free contrib\n\
    deb-src http://mirrors.163.com/debian/ jessie-backports main non-free contrib\n\
    deb http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib\n\
    deb-src http://mirrors.163.com/debian-security/ jessie/updates main non-free contrib\n\
    deb http://ftp.cn.debian.org/debian jessie main" > /etc/apt/sources.list

RUN apt-get -y update
# recommend
RUN apt-get install -y \
      curl vim wget

# clean
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/cache/nginx"]
# web resource
VOLUME /usr/share/nginx/html

ADD default.conf $EGINX_HOME/conf.d/

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
