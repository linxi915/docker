# Ruby
#
# https://github.com/docker-library/ruby
# NAME: kennylee26/ruby:2.3.3

# Pull base image.
FROM ruby:2.6.3-stretch

# FIX APT Resource
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
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
