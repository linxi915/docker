#!/bin/bash

FTP_USER_NAME=ftp
FTP_USER_PASS=ftp

if [ ! -f /etc/pure-ftpd/pureftpd.pdb ]; then
    user=$FTP_USER_NAME
    pwd=$FTP_USER_PASS
    mkdir -p $FTP_USER_HOME/$user
    chown 1000:1000 $FTP_USER_HOME/$user
    (echo $pwd; echo $pwd) | pure-pw useradd $user -u ftpuser -d $FTP_USER_HOME/$user
    pure-pw mkdb
fi

bash -c '/usr/sbin/pure-ftpd --passiveportrange 30000:30009 --maxclientsnumber 30 --maxclientsperip 5 --clientcharset utf8 --login puredb:/etc/pure-ftpd/pureftpd.pdb --prohibitdotfileswrite --noanonymous --createhomedir --nochmod'
