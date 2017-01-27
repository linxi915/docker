FROM anapsix/alpine-java:jre8

MAINTAINER kennylee26 <kennylee26@gmail.com>

# Install base packages
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add curl bash tzdata tar unzip && \ 
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo -ne "Alpine Linux 3.4 image. (`uname -rsv`)\n" >> /root/.built && \
    rm -fr /tmp/* /var/cache/apk/*

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME "/opt/jdk"
ENV JAVA_OPTS "-server -Xms128m -Xmx1024m" 

# Define bash as default command
CMD ["/bin/bash"]    
