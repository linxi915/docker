# see also https://github.com/stilliard/docker-pure-ftpd
FROM stilliard/pure-ftpd

ENV PUBLICHOST localhost

CMD /run.sh -c 30 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 30000:30059
