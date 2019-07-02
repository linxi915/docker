#!/bin/bash

OPENCV_JAR_PATH=/usr/local/share/java/opencv4/opencv-410.jar

cd /tmp/ && \
    javac -cp ${OPENCV_JAR_PATH}: opencv_version.java && \
	java -cp ${OPENCV_JAR_PATH}: opencv_version
