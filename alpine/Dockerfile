FROM alpine:3.4

MAINTAINER kennylee26 <kennylee26@gmail.com>

# 使用中科大源
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.4/main/ \n\
http://mirrors.ustc.edu.cn/alpine/v3.4/community" > /etc/apk/repositories

# Install base packages
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add curl bash tzdata tar unzip && \ 
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo -ne "Alpine Linux 3.4 image. (`uname -rsv`)\n" >> /root/.built && \
    rm -fr /tmp/* /var/cache/apk/*

# Define bash as default command
CMD ["/bin/bash"]
