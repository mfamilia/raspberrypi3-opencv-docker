FROM resin/raspberrypi3-python:3.6

# Install dependencies needed for building and running OpenCV
RUN apt-get update && apt-get install -y --no-install-recommends \
    # to build and install
    unzip \
    build-essential cmake pkg-config \
    checkinstall yasm \
    # to work with images
    libjpeg-dev libtiff-dev libjasper-dev libpng12-dev libtiff5-dev \
    # to work with videos
    libavcodec-dev libavformat-dev libswscale-dev \
    libxine2-dev libv4l-dev

ARG OPENCV_VERSION=4.0.0

RUN cd /usr/include/linux && \
    sudo ln -s -f ../libv4l1-videodev.h videodev.h

RUN apt-get install -y --no-install-recommends \
    libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
    # needed by highgui tool
    libgtk2.0-dev \
    # for opencv math operations
    libatlas-base-dev gfortran \
    # others
    libtbb2 libtbb-dev qt5-default \
    libmp3lame-dev libtheora-dev \
    libvorbis-dev libxvidcore-dev libx264-dev \
    libopencore-amrnb-dev libopencore-amrwb-dev \
    libavresample-dev \
    x264 v4l-utils \
    # cleanup
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoremove

# Install python packages
RUN pip install --no-cache-dir \
    # OpenCV dependency
    numpy \
    # other usefull stuff
    ipython \
    # cleanup
    && find /usr/local \
       \( -type d -a -name test -o -name tests \) \
       -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
       -exec rm -rf '{}' + \
    && cd / \
    && rm -rf /usr/src/python ~/.cache

RUN mkdir opencv && cd opencv
WORKDIR /opencv

COPY download.sh download.sh
RUN ./download.sh
COPY configure.sh configure.sh
RUN ./configure.sh
COPY build.sh build.sh
RUN ./build.sh
COPY install.sh install.sh
RUN ./install.sh
COPY verify.sh verify.sh
RUN ./verify.sh

WORKDIR /
