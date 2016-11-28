# Gollum
FROM registry.alauda.cn/kenny/docker-ruby:2.3.3

# FIX APT Resource
ADD ./sources.list.jessie /etc/apt/sources.list

#FIX Ruby RESOURCE
RUN bundle config mirror.https://rubygems.org https://ruby.taobao.org
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/

# recommend lib
RUN apt-get update && \
    apt-get install -y \
      curl git unzip vim wget
RUN apt-get -y install libicu-dev
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN gem install gollum
RUN gem install github-markdown org-ruby 
VOLUME /wiki
WORKDIR /wiki
CMD ["gollum", "--port", "80"]
EXPOSE 80
