FROM registry.cn-hangzhou.aliyuncs.com/kennylee/java:openjdk-8-jdk

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -y python-software-properties software-properties-common

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs && \
    apt-get install -y inetutils-ping net-tools dnsutils supervisor && \
    apt-get install -y python-pip && \
    pip install supervisor-stdout
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# add cnpm for taobao registry
RUN npm install -g cnpm pm2 --registry=https://registry.npm.taobao.org

COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define default command.
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
