#!/bin/bash

# 不修改webroot的名字，不然DEMO页面都会有影响，除非不看全部demo
FINEBI_DIR="${CATALINA_HOME}/webapps/webroot"

if [[ ! -d $FINEBI_DIR ]]; then
  echo "finebi app not installed."
  echo "extract to webapps"

  # 压缩包是从windows获得并且打包的，所以有乱码问题。解压时指定编码。
  cd /tmp && unzip -O GB18030 webroot.zip &&
    mv webroot ${FINEBI_DIR}

  cp ${JAVA_HOME}/lib/tools.jar ${FINEBI_DIR}/WEB-INF/lib
fi

exec ${CATALINA_HOME}/bin/catalina.sh run
