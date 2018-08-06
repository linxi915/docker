# see also https://github.com/stilliard/docker-pure-ftpd
FROM stilliard/pure-ftpd

ENV PUBLICHOST localhost
ENV FTP_USER=ftp
ENV FTP_PWD=ftp

COPY ./create_user.sh /create_user.sh
RUN chmod +x /create_user.sh 
RUN /create_user.sh

# Define default command.
CMD /run.sh --maxclientsnumber 30 --maxclientsperip 10 --clientcharset utf8 --login puredb:/etc/pure-ftpd/pureftpd.pdb --noanonymous -j -R -P $PUBLICHOST --passiveportrange 30000:30059
