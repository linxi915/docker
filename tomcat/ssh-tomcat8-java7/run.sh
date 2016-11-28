#!/bin/bash

if [ ! -f /.tomcat_admin_created ] && [ -f /create_tomcat_admin_user.sh ]; then
    /create_tomcat_admin_user.sh
fi

/bin/bash -c "${CATALINA_HOME}/bin/startup.sh && /usr/sbin/sshd -D"


