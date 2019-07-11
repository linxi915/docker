FROM registry.cn-hangzhou.aliyuncs.com/kennylee/opencv

MAINTAINER kennylee26 <kennylee26@gmail.com>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends bzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir numpy opencv_python opencv-contrib-python dlib imutils && \
        mkdir -p /var/dlib-data/ && cd /var/dlib-data/ && \
        wget -q http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2 \
        -O shape_predictor_68_face_landmarks.dat.bz2 && \
        wget -q http://dlib.net/files/shape_predictor_5_face_landmarks.dat.bz2 \
        -O shape_predictor_5_face_landmarks.dat.bz2 && \
        bzip2 -d shape_predictor_68_face_landmarks.dat.bz2 shape_predictor_5_face_landmarks.dat.bz2 && \
        rm -f *.bz2
