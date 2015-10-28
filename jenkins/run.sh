#!/bin/bash

if [ ! -f '/var/log/jenkins/jenkins.log' ]; then
    mkdir -p /var/log/jenkins/ && touch /var/log/jenkins/jenkins.log
fi

bash -c '/etc/init.d/jenkins start && tail -f /var/log/jenkins/jenkins.log'

