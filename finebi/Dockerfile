FROM registry.cn-hangzhou.aliyuncs.com/kennylee/tomcat:tomcat8-jdk8

MAINTAINER kennylee <kennylee26@gmail.com>

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y lsb-core iproute2 && \
  rm -rf /var/lib/apt/lists/*

ENV CATALINA_HOME /opt/tomcat
ENV EXTAR_JAR_DIR /libs

WORKDIR ${CATALINA_HOME}
ENV JAVA_OPTS="-Djava.security.egd=file:///dev/urandom -server -Xms128m -Xmx1532m -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/var/findbi/finebi_heapdump"

RUN mkdir -p /var/findbi/finebi_heapdump

# 拷贝进去就行了。由于fine的数据是在webroot目录以下，所以使用脚本实现解压，不能解压好运行。
COPY app/webroot.zip /tmp/

COPY run.sh /run.sh
RUN chmod +x /*.sh

RUN mkdir -p ${EXTAR_JAR_DIR}
COPY ./libs/*.jar ${EXTAR_JAR_DIR}

VOLUME ${CATALINA_HOME}/webapps/

CMD ["/run.sh"]