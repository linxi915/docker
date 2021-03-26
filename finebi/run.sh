#!/bin/bash

# 不修改webroot的名字，不然DEMO页面都会有影响，除非不看全部demo
FINEBI_NAME="webroot"
WEB_HOME="${CATALINA_HOME}/webapps"
FINEBI_DIR="${WEB_HOME}/${FINEBI_NAME}"
EXTRA_JAR_DIR="/libs"

if [[ -f ${WEB_HOME}/reinstall ]]; then
  rm -rf ${FINEBI_DIR} &&
    rm -f ${WEB_HOME}/reinstall
fi

if [[ ! -d $FINEBI_DIR ]]; then
  echo "finebi app not installed."
  echo "extract to webapps"

  # 压缩包是从windows获得并且打包的，所以有乱码问题。解压时指定编码。
  cd /tmp && unzip -O GB18030 webroot.zip &&
    mv /tmp/webroot ${FINEBI_DIR}

  cp ${JAVA_HOME}/lib/tools.jar ${FINEBI_DIR}/WEB-INF/lib
  # 拷贝附加jar包（如驱动）到应用
  cp ${EXTRA_JAR_DIR}/*.jar ${FINEBI_DIR}/WEB-INF/lib
fi

exec ${CATALINA_HOME}/bin/catalina.sh run
