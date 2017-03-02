FROM registry.cn-hangzhou.aliyuncs.com/kennylee/node:alpine

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN mkdir /src
RUN alias cnpm="npm --registry=https://registry.npm.taobao.org --cache=$HOME/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=$HOME/.cnpmrc"
RUN cnpm install express-generator nodemon -g

WORKDIR /src

COPY app/package.json /src/package.json

RUN cnpm install

EXPOSE 3000

CMD ["nodemon","app/bin/www"]
