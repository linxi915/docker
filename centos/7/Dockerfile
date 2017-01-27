FROM centos:7

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo

RUN yum -y update && \
    yum -y install git unzip vim wget && \
    yum -y install kde-l10n-Chinese bitmap-fonts bitmap-fonts-cjk && \
    #yum -y reinstall glibc-common && \
    yum clean all

RUN locale 

# Set environment variables.
ENV HOME /root
ENV LANG=en_US.UTF-8\
    LANGUAGE=zh_CN:zh:en_US:en\
    LC_ALL=en_US.UTF-8\
    TZ=Asia/Shanghai\
    TERM=xterm

RUN unlink /etc/localtime
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
        echo $TZ > /etc/timezone        

# Define working directory.
WORKDIR $HOME

CMD ["/bin/bash"]
