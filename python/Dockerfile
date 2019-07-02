# Ubuntu+python3
#
# Authoer: kennylee26

FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y python3 python3-dev python-dev python-pip python3-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && python --version

RUN mkdir -p $HOME/.config/pip/
COPY pip.conf /tmp
RUN mv /tmp/pip.conf $HOME/.config/pip/

RUN pip install pydns &&  pip3 install py3dns

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
