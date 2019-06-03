# alpine环境下编译node实在太慢，所以以这个为基础镜像比较划算了。
FROM node:12-alpine

MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV ALPINE_VERSION 3.9
# 使用阿里云镜像
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# Install base packages
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add curl bash tzdata tar unzip xz procps wget git openssh && \ 
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    echo -ne "Alpine Linux "+ ${ALPINE_VERSION} + " image. (`uname -rsv`)\n" >> /root/.built && \
    rm -fr /tmp/* /var/cache/apk/*

ENV LANG C.UTF-8

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

##############  install openjdk 8 
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

ENV JAVA_VERSION 8u212
ENV JAVA_ALPINE_VERSION 8.212.04-r0

RUN set -x \
	&& apk add --no-cache \
		openjdk8="$JAVA_ALPINE_VERSION" \
	&& [ "$JAVA_HOME" = "$(docker-java-home)" ]

RUN set -o errexit -o nounset \
    && echo "Testing Java installation" \
    && java -version

##############  install maven

ARG MAVEN_VERSION=3.6.0
ARG USER_HOME_DIR="/root"
ARG SHA=fae9c12b570c3ba18116a4e26ea524b29f7279c17cbaadc3326ca72927368924d9131d11b9e851b8dc9162228b6fdea955446be41207a5cfc61283dd8a561d2f
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

# 容器内本地maven库
VOLUME /var/maven/repository

ENV MAVEN_SETING_FILE=/usr/share/maven/conf/settings.xml
RUN wget https://gitee.com/kennylee/docker/raw/master/maven/settings.xml
RUN mv settings.xml ${MAVEN_SETING_FILE}
RUN mkdir -p ${MAVEN_CONFIG} && cp ${MAVEN_SETING_FILE} ${MAVEN_CONFIG}

RUN set -o errexit -o nounset \
    && echo "Testing Maven installation" \
    && mvn --version

##############  install gradle
ENV GRADLE_HOME /opt/gradle

# 注意SHA256要匹配，
ARG GRADLE_VERSION=5.4.1
ARG GRADLE_DOWNLOAD_SHA256=7bdbad1e4f54f13c8a78abc00c26d44dd8709d4aedb704d913fb1bb78ac025dc
ENV GRADLE_VERSION=$GRADLE_VERSION

RUN set -o errexit -o nounset \
    && echo "Downloading Gradle" \
    && wget -qO gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    \
    && echo "Checking download hash" \
    && echo "${GRADLE_DOWNLOAD_SHA256} *gradle.zip" | sha256sum -c - \
    \
    && echo "Installing Gradle" \
    && unzip gradle.zip \
    && rm gradle.zip \
    && mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
    && ln -s "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle

VOLUME "/root/.gradle"

RUN set -o errexit -o nounset \
    && echo "Testing Gradle installation" \
    && gradle --version

