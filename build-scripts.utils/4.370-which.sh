#!/bin/bash
source /physix/include.sh || exit 1
source /physix/build.conf || exit 1
cd /sources/$1 || exit 1

./configure --prefix=/usr 
chroot_check $? "which : configure"

make
chroot_check $? "which : make"

make install
chroot_check $? "which : make install"

