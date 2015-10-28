#
# Oracle Java 7 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java7
# NAME kennylee26/java:oracle-java7

# Pull base image.
FROM kennylee26/ubuntu

# Install Java.
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV JAVA_OPTS "-server -Xms128m -Xmx1024m -XX:PermSize=64M -XX:MaxPermSize=192M"

# Define default command.
CMD ["bash"]
