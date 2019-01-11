#!/bin/bash

python -c "import cv2; print('Installed OpenCV version is: {} :)'.format(cv2.__version__))"
if [ $? -eq 0 ]; then
    echo "OpenCV installed successfully! ........................."
else
    echo "OpenCV installation failed :( ........................."
    SITE_PACKAGES_DIR=/usr/local/lib/python3.6/site-packages
    echo "$SITE_PACKAGES_DIR contents: "
    echo `ls -ltrh $SITE_PACKAGES_DIR`
    echo "Note: temporary installation dir $WS_DIR/opencv is not removed!"
    exit 1
fi

rm -rf /opencv

