#!/bin/bash

OPENCV_SRC_DIR=`pwd`/opencv-$OPENCV_VERSION

cd $OPENCV_SRC_DIR/build

make -j4
