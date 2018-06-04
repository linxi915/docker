FROM gitlab/gitlab-ce:10.8.3-ce.0

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update && \
    apt-get install git -y
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Shanghai

