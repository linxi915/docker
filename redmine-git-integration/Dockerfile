# Redmine for advanced git integration
#
# Authoer: kennylee26
# Command format: Instruction [arguments command] ..

# 第一行必须指定基于的基础镜像
FROM kennylee26/ubuntu

# 维护者信息
MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV GIT_HOME /home/git/

RUN add-apt-repository ppa:git-core/ppa -y
RUN apt-get update && \
    apt-get install -y git apache2 apache2-utils perl libdbd-mysql-perl libapache2-mod-perl2

RUN a2enmod cgi alias env rewrite

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p $GIT_HOME
RUN chgrp -R www-data $GIT_HOME

RUN sed -i 's/MaxKeepAliveRequests 100/MaxKeepAliveRequests 512/g' /etc/apache2/apache2.conf
#RUN sed -i 's/KeepAliveTimeout 5/KeepAliveTimeout 15/g' /etc/apache2/apache2.conf
#RUN sed -i 's/KeepAlive On/KeepAlive Off/g' /etc/apache2/apache2.conf

COPY git-http.conf /etc/apache2/sites-enabled/git-http.conf
RUN sed -i "s%/home/git%$GIT_HOME%g" /etc/apache2/sites-enabled/git-http.conf
COPY Redmine.pm /usr/share/perl5/Apache2/Redmine.pm
RUN mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf.bak

COPY run.sh /run.sh
RUN chmod +x /*.sh

EXPOSE 80

CMD ["/run.sh"]
