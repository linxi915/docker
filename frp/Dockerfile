FROM registry.cn-hangzhou.aliyuncs.com/kennylee/ubuntu:xenial

MAINTAINER kennylee26 <kennylee26@gmail.com>

# Define working directory.
WORKDIR /data

COPY frp_download.sh frp_download.sh 
RUN chmod +x ./*.sh

RUN bash ./frp_download.sh && \
    mkdir frp && \
    tar zxf frp_*.tar.gz -C frp --strip-components 1 && \
    rm frp_*.tar.gz frp_download.sh

# Define default command.
CMD ["bash"]
