# Ruby
#
# https://github.com/docker-library/ruby
# NAME: kennylee26/ruby:2.3.3

# Pull base image.
FROM registry.alauda.cn/kenny/docker-ruby:2.3.3

# FIX APT Resource
RUN curl http://mirrors.163.com/.help/sources.list.jessie>/etc/apt/sources.list

#FIX Ruby RESOURCE
RUN bundle config mirror.https://rubygems.org https://ruby.taobao.org
RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/

# recommend lib
RUN apt-get update && \
    apt-get install -y \
        git unzip vim wget

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define default command.
CMD [ "irb" ]
