# Tomcat8+jre8
#
# Authoer: kennylee26
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM kennylee26/java8

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get install -yq python-pip python-dev mysql-client libmysqlclient-dev && \
    apt-get install -yq language-pack-zh-hans && \    
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN locale
ENV LANG=zh_CN.UTF-8;\
    LANGUAGE=zh_CN:zh:en_US:en;\
    LC_ALL=zh_CN.UTF-8;\
    TZ="Asia/Shanghai";\
    TERM=xterm
RUN echo "Asia/Shanghai"  | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

RUN pip install MySQL-python beautifulsoup4

ENV TOMCAT_MAJOR_VERSION 8
ENV CATALINA_HOME /opt/tomcat

# INSTALL TOMCAT
RUN curl -sSL http://git.oschina.net/kennylee/python-tools/raw/master/tomcat_download.py | python - ${TOMCAT_MAJOR_VERSION}
RUN tar zxf apache-tomcat-*.tar.gz && \
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

COPY docker-entrypoint.py /entrypoint.py

EXPOSE 8080

CMD ["python", "/entrypoint.py"]
