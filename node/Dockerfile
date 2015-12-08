# Nodejs
# NAME: kennylee26/node

# Pull base image.
FROM node:5.1.1

# resp
RUN curl http://mirrors.163.com/.help/sources.list.jessie>/etc/apt/sources.list
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

RUN npm config set registry=http://registry.npm.taobao.org

# recommend lib
RUN apt-get update && \
    apt-get install -y \
      curl git unzip vim wget

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define default command.
CMD [ "irb" ]
