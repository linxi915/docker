# see also https://github.com/stilliard/docker-pure-ftpd
FROM stilliard/pure-ftpd:stretch-latest

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY stretch.sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y curl git unzip vim wget && \
    apt-get install -y locales kde-l10n-zhcn && \ 
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen

RUN locale && locale-gen "zh_CN.UTF-8"

# Set environment variables.
ENV LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN:zh:en_US:en \
    LC_ALL=zh_CN.UTF-8 \
    TZ=Asia/Shanghai \
    DEBIAN_FRONTEND="noninteractive" \
    TERM=xterm

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
            echo $TZ > /etc/timezone && \        
            dpkg-reconfigure --frontend noninteractive tzdata && \
            dpkg-reconfigure --frontend noninteractive locales


