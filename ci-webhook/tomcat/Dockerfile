FROM registry.cn-hangzhou.aliyuncs.com/kennylee/sshd-tomcat

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -y python-software-properties software-properties-common

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apt-get install nodejs
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# add cnpm for taobao registry
RUN npm install -g cnpm child_process pm2 --registry=https://registry.npm.taobao.org

RUN cd /root && git clone https://git.oschina.net/kennylee/ci-webhook.git ci-webhook
RUN cd ci-webhook && npm install 
COPY server.js /root/ci-webhook/server.js

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Define default command.
CMD ["/usr/bin/supervisord"]
