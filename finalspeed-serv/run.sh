#!/bin/bash

install_path=/fs/

sh ${install_path}"restart.sh"
sleep 1s
tail -f ${install_path}"server.log"
