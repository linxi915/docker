# Gitbook
# NAME: kennylee26/gitbook

# Pull base image.
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/node:12.2-stretch

ENV BOOKDIR /gitbook

# Basic Requirements
RUN \
  apt-get update && \
  apt-get install -y calibre apt-utils

# install fonts
RUN apt-get install -y fonts-wqy-microhei

RUN cnpm install gitbook-cli -g && \
    cnpm install svgexport -g
    
ENV GIT_BOOK_VERSION="3.2.3"
RUN gitbook fetch $GIT_BOOK_VERSION

# install recommend plugins

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME $BOOKDIR
WORKDIR $BOOKDIR

EXPOSE 4000

# Define default command.
ENTRYPOINT ["gitbook"]
CMD ["--help"]
