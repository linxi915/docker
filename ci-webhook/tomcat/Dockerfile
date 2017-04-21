FROM registry.cn-hangzhou.aliyuncs.com/kennylee/sshd-tomcat:tomcat8-jdk7-nodejs7

ENV REPO_URL=http://sys:11111111@192.168.3.231:10080/zgbj/gkxt.git
ENV PROJECT_NAME=gkxt
ENV PROJECT_BRANCH=feature_testci

RUN sed -i "s@\/usr\/lib\/jvm\/java-7-oracle@${JAVA_HOME}@" /etc/init.d/tomcat
RUN sed -i "s@-server -Xms128m -Xmx1024m -XX\:PermSize=64M -XX\:MaxPermSize=192M@${JAVA_OPTS}@" /etc/init.d/tomcat

RUN cd /root && git clone https://git.oschina.net/kennylee/ci-webhook.git ci-webhook
RUN cd ci-webhook && cnpm install
RUN cd /tmp/ && git clone $REPO_URL $PROJECT_NAME && cd $PROJECT_NAME && git checkout $PROJECT_BRANCH
RUN cd /tmp/$PROJECT_NAME && ./gradlew --no-daemon clean dist -x test
RUN rm -rf ${CATALINA_HOME}/webapps/* && unzip /tmp/$PROJECT_NAME/build/dist/*.zip -d ${CATALINA_HOME}/webapps/

COPY deploy.sh /deploy.sh
RUN chmod +x /deploy.sh

