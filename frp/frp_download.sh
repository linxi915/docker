#! /bin/bash

FRP_LATEST_VERSION=`curl -sSL http://git.oschina.net/kennylee/shell/raw/master/get_github_prj_latest_version.sh | bash -s https://github.com/fatedier/frp/releases`

if [ ${#FRP_LATEST_VERSION} -ne 0 ]; then
    wget "https://github.com/fatedier/frp/releases/download/v$FRP_LATEST_VERSION/frp_${FRP_LATEST_VERSION}_linux_amd64.tar.gz"
fi


