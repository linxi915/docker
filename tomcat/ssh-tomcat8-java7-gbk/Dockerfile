# Tomcat
#
# VERSION 0.0.1
# Authoer: kennylee26
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM registry.alauda.cn/kenny/tomcat:tomcat8-jdk7

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y openssh-server && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

# Add root password
RUN echo 'root:111111' | chpasswd

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN ln -s ${CATALINA_HOME} ${HOME}/tomcat

COPY server.xml /tmp/
RUN cp -f /tmp/server.xml ${CATALINA_HOME}/conf/

# set ssh user source
RUN echo "export JAVA_HOME=${JAVA_HOME}" >> ${HOME}/.bashrc
RUN echo "export JAVA_OPTS=\"${JAVA_OPTS}\"" >> ${HOME}/.bashrc
RUN echo "export CATALINA_HOME=${CATALINA_HOME}" >> ${HOME}/.bashrc

COPY run.sh /run.sh
RUN chmod +x /*.sh

# Define working directory.
WORKDIR ${HOME}

# Define default command.
EXPOSE 22
EXPOSE 8080

CMD ["/run.sh"]
