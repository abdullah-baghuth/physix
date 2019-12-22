#!/bin/bash
source /physix/include.sh || exit 1
source /physix/build.conf || exit 1
cd /sources/$1 || exit 1

./configure --prefix=/usr --disable-static
chroot_check $? "json-c : configure" 

make
chroot_check $? "json-c : make"

make install
chroot_check $? "json-c : make install"

