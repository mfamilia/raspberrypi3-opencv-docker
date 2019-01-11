#!/bin/bash

wget -O opencv.zip https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip
unzip opencv.zip
rm -rf opencv.zip

wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip
unzip opencv_contrib.zip
rm -rf opencv_contrib.zip
