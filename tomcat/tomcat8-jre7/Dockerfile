FROM registry.cn-hangzhou.aliyuncs.com/kennylee/java:openjdk-7-jre

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TOMCAT_MAJOR_VERSION 8
ENV CATALINA_HOME /opt/tomcat

RUN curl -s -o /tmp/v.html  http://mirror.bit.edu.cn/apache/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/

# INSTALL TOMCAT
RUN wget http://mirror.bit.edu.cn/apache/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v`cat /tmp/v.html | grep "<a href=\"v"| sed -e "s/<[^>]*>//g" | awk 'END{print $1}' | sed 's:^.\(.*\).$:\1:'`/bin/apache-tomcat-`cat /tmp/v.html | grep "<a href=\"v"| sed -e "s/<[^>]*>//g" | awk 'END{print $1}' | sed 's:^.\(.*\).$:\1:'`.tar.gz && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME} && \
    rm /tmp/v.html    

# set config
COPY server.xml /tmp/
RUN cp -f /tmp/server.xml ${CATALINA_HOME}/conf/

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
