# see also https://github.com/stilliard/docker-pure-ftpd
FROM stilliard/pure-ftpd

ENV PUBLICHOST localhost

CMD /run.sh --maxclientsnumber 30 --maxclientsperip 10 --clientcharset utf8 --login puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R --passiveportrange 30000:30059
