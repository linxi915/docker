FROM registry.cn-hangzhou.aliyuncs.com/kennylee/python:python3	

MAINTAINER kennylee26 <kennylee26@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

ENV OPENCV_VERSION 4.1.0
ENV NUM_CORES 8

ARG OPENCV_GIT_URL=https://github.com/opencv/opencv.git
ARG OPENCV_CONTRIB_GIT_URL=https://github.com/opencv/opencv_contrib

# Install OpenCV
RUN apt-get -y update && \
    apt-get -y install build-essential \
                       cmake \
                       git \
                       pkg-config \
                       libatlas-base-dev \
                       libavcodec-dev \
                       libavformat-dev \
                       libgtk2.0-dev \
                       libswscale-dev \
                       # Optional
                       libdc1394-22-dev \
                       libjpeg-dev \
                       libpng-dev \
                       libtbb2 \
                       libtbb-dev \
                       libtiff-dev \
                       libv4l-dev \
                       libvtk6-dev \
                       # Tools
                       imagemagick \
                       && \
    apt-get autoclean autoremove 
    
RUN pip install --no-cache-dir numpy matplotlib scipy

# Get OpenCV src
RUN cd / && git clone -b $OPENCV_VERSION --single-branch --depth 1 ${OPENCV_GIT_URL} opencv && \
    cd / && git clone -b $OPENCV_VERSION --single-branch --depth 1 ${OPENCV_CONTRIB_GIT_URL} opencv_contrib

# build 
RUN mkdir -p /opencv/build && \
    cd /opencv/build && \
    # Lets build OpenCV
    cmake \
      -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D ENABLE_PRECOMPILED_HEADERS=OFF \

      -D INSTALL_C_EXAMPLES=OFF \
      -D INSTALL_PYTHON_EXAMPLES=OFF \

      -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
      -D BUILD_EXAMPLES=OFF \

      -D BUILD_NEW_PYTHON_SUPPORT=ON \

      -D BUILD_DOCS=OFF \
      -D BUILD_TESTS=OFF \
      -D BUILD_PERF_TESTS=OFF \
      -D WITH_TBB=ON \
      -D WITH_OPENMP=ON \
      -D WITH_IPP=ON \
      -D WITH_CSTRIPES=ON \
      -D WITH_OPENCL=ON \
      -D WITH_V4L=ON \
      -D WITH_VTK=ON \
      .. &&\
    make -j$NUM_CORES && \
    make install && \
    ldconfig && \
    # Clean the install from sources
    cd / && \
    rm -r /opencv && \
    rm -r /opencv_contrib

# Define default command.
CMD ["bash"]

