# Ruby
#
# https://github.com/docker-library/ruby

# Pull base image.
FROM ruby:2.6-stretch

MAINTAINER kennylee26 <kennylee26@gmail.com>

# FIX APT Resource
RUN mv /etc/apt/sources.list /etc/apt/sources.list
COPY stretch.sources.list /etc/apt/sources.list

# FIX Ruby RESOURCE
RUN bundle config mirror.https://rubygems.org https://ruby.taobao.org
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/

# recommend lib
RUN apt-get update && \
    apt-get install -y git unzip vim wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define default command.
CMD [ "irb" ]
