#!/bin/bash

OPENCV_SRC_DIR=`pwd`/opencv-$OPENCV_VERSION

cd $OPENCV_SRC_DIR/build

make install && ldconfig

cd /usr/local/lib/python3.6/site-packages/ &&
  ln -s /usr/local/python/cv2/python-3.6/cv2.cpython-36m-arm-linux-gnueabihf.so cv2.so
