FROM kennylee26/java8

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get -y update && \
    apt-get -y install language-pack-zh-hans && \
    rm -rf /var/lib/apt/lists/* 
RUN locale
ENV LANG=zh_CN.UTF-8;\
    LANGUAGE=zh_CN:zh:en_US:en;\
    LC_ALL=zh_CN.UTF-8;\
    TZ="Asia/Shanghai";\
    TERM=xterm
RUN echo "Asia/Shanghai"  | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

COPY ./app/lts-jobtracker.jar /data/lts-jobtracker.jar

CMD ["bash"]
