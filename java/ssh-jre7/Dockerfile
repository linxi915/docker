FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu:trusty

MAINTAINER kennylee26 <kennylee26@gmail.com>

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jre openssh-server && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

# Add root password
RUN echo 'root:111111' | chpasswd

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV JAVA_OPTS "-server -Xms128m -Xmx1024m -XX:PermSize=64M -XX:MaxPermSize=192M"

COPY run.sh /run.sh
RUN chmod +x /*.sh

# Define default command.
EXPOSE 22

CMD ["/run.sh"]
