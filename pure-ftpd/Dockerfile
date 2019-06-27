# see also https://github.com/stilliard/docker-pure-ftpd
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/pure-ftpd:stretch-without-user

MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV PUBLICHOST localhost
ENV FTP_USER_HOME=/home/ftpusers \
    FTP_USER_NAME=ftp \
    FTP_USER_PASS=ftp

COPY ./create_user.sh /create_user.sh
RUN chmod +x /create_user.sh 
RUN /create_user.sh

# Define default command.
CMD /run.sh --maxclientsnumber 30 --maxclientsperip 10 --clientcharset utf8 --login puredb:/etc/pure-ftpd/pureftpd.pdb --noanonymous -j -R -P $PUBLICHOST --passiveportrange 30000:30059
