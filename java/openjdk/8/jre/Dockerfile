FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu

MAINTAINER kennylee26 <kennylee26@gmail.com>

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-8-jre && \
  rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_OPTS "-server -Xms128m -Xmx1024m"

# Define default command.
CMD ["bash"]
