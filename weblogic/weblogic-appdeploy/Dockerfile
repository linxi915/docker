# LICENSE CDDL 1.0 + GPL 2.0
#
# Copyright (c) 2015 Oracle and/or its affiliates. All rights reserved.
# 
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This Dockerfile extends the Oracle WebLogic image built under 1221-domain with tag name '1221-domain'
#
# It will deploy any package defined in APP_PKG_FILE located in APP_PKG_LOCATION
# into the DOMAIN_HOME with name defined in APP_NAME
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Run: 
#      $ docker build -t 1221-appdeploy .
#

# Pull base image
# ---------------
FROM registry.cn-hangzhou.aliyuncs.com/kennylee/weblogic-domain:12.2.1.2.0-jre8 

# Maintainer
# ----------
MAINTAINER Bruno Borges <bruno.borges@oracle.com>

# Define variables
ENV APP_NAME="app" \
    APP_PKG_FILE="sample.war" \
    APP_PKG_LOCATION="/u01/oracle/app"

# Copy files and deploy application in WLST Offline mode
COPY container-scripts/* /u01/oracle/
VOLUME /u01/oracle/app/

RUN wlst /u01/oracle/app-deploy.py

