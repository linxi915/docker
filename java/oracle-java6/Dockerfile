#
# Oracle Java 6 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java6
# NAME: kennylee26/java:oracle-java6 
#

# Pull base image.
FROM kennylee26/ubuntu

# Install Java.
RUN \
  echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java6-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk6-installer

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-6-oracle
ENV JAVA_OPTS "-server -Xms128m -Xmx1024m -XX:PermSize=64M -XX:MaxPermSize=192M"

# Define default command.
CMD ["bash"]
