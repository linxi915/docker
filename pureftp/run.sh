#!/bin/bash

if [ ! -f /etc/pure-ftpd/pureftpd.pdb ]; then
    user='ftp'
    pwd='ftp'
    mkdir -p $FTP_USER_HOME/$user
    chown 1000:1000 $FTP_USER_HOME/$user
    (echo $pwd; echo $pwd) | pure-pw useradd $user -u ftpuser -d $FTP_USER_HOME/$user
    pure-pw mkdb
fi

bash -c '/usr/sbin/pure-ftpd -c 30 -C 5 -9 utf8 -l puredb:/etc/pure-ftpd/pureftpd.pdb -x -E -j -R'
