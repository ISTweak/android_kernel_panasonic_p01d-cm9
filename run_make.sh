#!/bin/bash
CCOMPILER=~/work/linaro-arm473/bin/arm-linux-gnueabihf-
KERNEL_DIR=$PWD

rm -rf modules
mkdir -p modules

make -j3 ARCH=arm CROSS_COMPILE=$CCOMPILER
find . -name *.ko -exec cp {} modules \;

cd ../bcm4330/dhd/linux
make -j3 ARCH=arm CROSS_COMPILE=$CCOMPILER LINUXDIR=$KERNEL_DIR dhd-cdc-sdmmc-gpl
find . -name *.ko -exec cp {} $KERNEL_DIR/modules \;

cd $KERNEL_DIR
