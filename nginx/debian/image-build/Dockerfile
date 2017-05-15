# #####
# see also https://github.com/nginxinc/docker-nginx
# #####
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/debian:jessie

MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV NGINX_VERSION 1.13.0-1~jessie
ENV NJS_VERSION   1.13.0.0.1.10-1~jessie

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt=${NGINX_VERSION} \
						nginx-module-geoip=${NGINX_VERSION} \
						nginx-module-image-filter=${NGINX_VERSION} \
						nginx-module-njs=${NJS_VERSION} \
                        gettext-base \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

ENV EGINX_HOME=/etc/nginx

VOLUME ["/var/cache/nginx"]
VOLUME /usr/share/nginx/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
