FROM registry.cn-hangzhou.aliyuncs.com/kennylee/node:alpine

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN mkdir /src
RUN cnpm install express-generator nodemon -g

WORKDIR /src

COPY app/package.json /src/package.json

RUN cnpm install

EXPOSE 3000

CMD ["nodemon","app/bin/www"]
