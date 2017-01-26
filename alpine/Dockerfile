FROM alpine:3.4

MAINTAINER kennylee26 <kennylee26@gmail.com>

# Install base packages
RUN apk update && apk add curl bash tzdata tar unzip && \ 
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo -ne "Alpine Linux 3.4 image. (`uname -rsv`)\n" >> /root/.built

# Define bash as default command
CMD ["/bin/bash"]
