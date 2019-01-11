#!/bin/bash

OPENCV_SRC_DIR=`pwd`/opencv-$OPENCV_VERSION
OPENCV_CONTRIB_MODULES_SRC_DIR=`pwd`/opencv_contrib-$OPENCV_VERSION/modules

# build and install
cd $OPENCV_SRC_DIR

mkdir build && cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local \
  -D OPENCV_EXTRA_MODULES_PATH=$OPENCV_CONTRIB_MODULES_SRC_DIR \
  -D OPENCV_PYTHON2_INSTALL_PATH=/usr/local/lib/python3.6/site-packages/ \
  -D WITH_INF_ENGINE=ON \
  -D ENABLE_CXX11=ON \
  -D OPENCV_ENABLE_NONFREE=ON \
  ..
