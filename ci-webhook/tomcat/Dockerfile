FROM registry.cn-hangzhou.aliyuncs.com/kennylee/sshd-tomcat:tomcat8-jre7-nodejs7

RUN cd /root && git clone https://git.oschina.net/kennylee/ci-webhook.git ci-webhook

RUN cd ci-webhook && cnpm install 

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y python-pip && \
  pip install supervisor-stdout && \
  rm -rf /var/lib/apt/lists/*


