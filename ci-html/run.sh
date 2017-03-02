#! /bin/bash

while [ true ]
do
    git fetch
    rm -rf /usr/share/nginx/html/*
    cp -r $local_repo/$www_for_repo/* /usr/share/nginx/html
    sleep 5m
done
