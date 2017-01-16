FROM registry.cn-hangzhou.aliyuncs.com/kennylee/tomcat:tomcat8-jdk8

MAINTAINER kennylee26 <kennylee26@gmail.com>

COPY ./app/lts-admin/ ${CATALINA_HOME}/webapps/ROOT/

EXPOSE 8085
EXPOSE 8730

CMD ["python", "/entrypoint.py"]

