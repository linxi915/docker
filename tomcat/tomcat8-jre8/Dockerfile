FROM registry.cn-hangzhou.aliyuncs.com/kennylee/java:openjdk-8-jre

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.5.9
ENV CATALINA_HOME /opt/tomcat

# INSTALL TOMCAT
RUN wget https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -O- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME}

# set config
COPY server.xml /tmp/
RUN cp -f /tmp/server.xml ${CATALINA_HOME}/conf/
# Add admin/admin user
# COPY tomcat-users.xml /opt/tomcat/conf/

# Add service
COPY tomcat /etc/init.d/
RUN chmod +x /etc/init.d/tomcat

# Remove garbage
RUN rm -rf ${CATALINA_HOME}/webapps/examples && \
    rm -rf ${CATALINA_HOME}/webapps/docs && \
    rm -rf ${CATALINA_HOME}/webapps/ROOT

WORKDIR ${CATALINA_HOME}

COPY run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 8080

CMD ["/run.sh"]
