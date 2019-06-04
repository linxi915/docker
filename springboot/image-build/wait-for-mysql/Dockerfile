FROM registry.cn-hangzhou.aliyuncs.com/kennylee/springboot:jre8-alpine

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apk --no-cache update && \
    apk --no-cache add mysql-client && \
    rm -fr /tmp/* /var/cache/apk/*

COPY wait-for-mysql.sh /wait-for-mysql.sh
RUN chmod +x /wait-for-mysql.sh

ENTRYPOINT ["/wait-for-mysql.sh", "sh", "/entrypoint.sh"]
