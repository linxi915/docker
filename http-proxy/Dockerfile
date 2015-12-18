# Http Proxy
#
# see also https://github.com/nginxinc/docker-nginx
# Authoer: kennylee26
# NAME: kennylee26/httpproxy
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM nginx:1.9.8

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV EGINX_HOME=/etc/nginx

ADD sources.list.jessie /etc/apt/sources.list
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx">/etc/apt/sources.list.d/nginx.list

RUN apt-get -y update
# recommend
RUN apt-get install -y \
      curl vim wget

# clean
RUN rm -rf /var/lib/apt/lists/*

VOLUME ["/var/cache/nginx"]

ADD nginx/nginx.conf $EGINX_HOME/
ADD nginx/reverse-proxy.conf $EGINX_HOME/conf.d/

EXPOSE 8888

CMD ["nginx", "-g", "daemon off;"]
