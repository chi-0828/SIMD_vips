#!/bin/bash

uname -a
gcc --version
vips --version

# how large an image do you want to process? 
# sample2.v is 290x442 pixels ... replicate this many times horizontally and 
# vertically to get a highres image for the benchmark
tile=1


echo building test image ...
echo "tile=$tile"
vips im_replicate /media/gary/D/vips_gcc/temp.jpg \
            /media/gary/D/vips_gcc/temp2.jpg \
            $tile $tile
if [ $? != 0 ]; then
  echo "build of test image failed -- out of disc space?"
  exit 1
fi
echo -n "test image is" `vipsheader -f width /media/gary/D/vips_gcc/temp2.jpg` 
echo " by" `vipsheader -f height /media/gary/D/vips_gcc/temp2.jpg` "pixels"

echo "starting benchmark ..."


t1=`/usr/bin/time -f %e ./vips \
    im_conv_f /media/gary/D/vips_gcc/temp2.jpg \
    /media/gary/D/vips_gcc/testedge.jpg \
    /media/gary/D/vips_gcc/mask  2>&1`

echo $t1 '(s)'

