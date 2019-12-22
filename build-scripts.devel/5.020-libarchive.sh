#!/bin/bash
source /physix/include.sh || exit 1
source /physix/build.conf || exit 1
cd /sources/$1 || exit 1

./configure --prefix=/usr --disable-static 
chroot_check $? "libarchive : configure"

make
chroot_check $? "libarchive : make"

make install
chroot_check $? "libarchive : make install"

rm -rf /sources/$SRCD

