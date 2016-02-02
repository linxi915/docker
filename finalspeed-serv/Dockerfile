# finalspeed-server
# NAME: kennylee26/fs-server

# Pull base image.
FROM kennylee26/java7

# Basic Requirements
RUN \
  apt-get update && \
  apt-get install -y unzip wget libpcap-dev iptables

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV FS_HOME="/fs"
ENV FS_SERVER_URL="http://fs.d1sm.net/finalspeed/finalspeed_server.zip"
ENV FS_SERVER_NAME="finalspeed_server.zip"

RUN mkdir -p $FS_HOME
WORKDIR $FS_HOME

RUN wget -O $FS_SERVER_NAME $FS_SERVER_URL
RUN unzip -o $FS_SERVER_NAME -d $FS_HOME
RUN chmod +x $FS_HOME/restart.sh

EXPOSE 150

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
