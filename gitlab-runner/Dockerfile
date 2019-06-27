# Gitlab-runner
#
# Authoer: kennylee26
# Command format: Instruction [arguments command] ..

FROM sameersbn/gitlab-ci-multi-runner

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y unzip git curl
# Install Java8.
RUN \
  apt-get install -y openjdk-7-jdk && \
  rm -rf /var/lib/apt/lists/*

ENV  JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV JAVA_OPTS "-server -Xms128m -Xmx1024m"

ENTRYPOINT ["/sbin/entrypoint.sh"]
