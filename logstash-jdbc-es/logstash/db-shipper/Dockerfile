FROM registry.cn-hangzhou.aliyuncs.com/kennylee/logstash:5.3.0

COPY config/logstash.yml /usr/share/logstash/config/logstash.yml
COPY pipeline  /usr/share/logstash/pipeline

COPY ./lib/ /usr/share/logstash/lib/
