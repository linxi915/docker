FROM registry.cn-hangzhou.aliyuncs.com/kennylee/jenkins:lts

ENV JENKINS_USER ${user:-jenkins}

USER root

RUN apt-get update && \
    curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun && \  
    usermod -aG docker ${JENKINS_USER} && \
    apt-get install -y docker-compose && \
    rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/docker/ 

#RUN systemctl start docker

USER ${JENKINS_USER}


