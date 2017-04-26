#!/bin/bash

PROJECT_NAME=gkxt
REPO_BRANCH=feature_testci
CUSTOM_JAVA_OPTS=
BUILD_COMMAND="./gradlew --no-daemon clean dist -x test"

if [ -n "${JAVA_OPTS}" ]; then
    CUSTOM_JAVA_OPTS="$JAVA_OPTS"
fi

source /root/.bashrc
TOMCAT_WEBAPPS_PATH=$CATALINA_HOME'/webapps/'

if [ -n "${CUSTOM_JAVA_OPTS}" ]; then
    export JAVA_OPTS=$CUSTOM_JAVA_OPTS
fi

${CATALINA_HOME}/bin/catalina.sh stop
sleep 3s
cd /tmp/$PROJECT_NAME
git checkout $REPO_BRANCH
git fetch origin $REPO_BRANCH
git reset --hard origin/$REPO_BRANCH
$BUILD_COMMAND
/bin/bash -c "rm -rf ${TOMCAT_WEBAPPS_PATH}* && unzip /tmp/$PROJECT_NAME/build/dist/*.zip -d $TOMCAT_WEBAPPS_PATH && ${CATALINA_HOME}/bin/catalina.sh run"

