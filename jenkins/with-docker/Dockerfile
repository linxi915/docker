FROM registry.cn-hangzhou.aliyuncs.com/kennylee/jenkins:lts

ENV JENKINS_USER ${user:-jenkins}

USER root

RUN apt-get update && \
    curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun && \  
    usermod -aG docker ${JENKINS_USER} && \
    apt-get install -y docker-compose mysql-client && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG root ${JENKINS_USER}
RUN chown ${JENKINS_USER}:docker ~/

USER ${JENKINS_USER}

