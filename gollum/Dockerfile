# Gollum
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ruby:2.6-stretch	

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
        apt-get -y install libicu-dev && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*
    
RUN gem install gollum
RUN gem install github-markdown org-ruby 
VOLUME /wiki
WORKDIR /wiki
CMD ["gollum", "--port", "80"]

EXPOSE 80
