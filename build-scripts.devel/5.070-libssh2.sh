#!/bin/bash
source /physix/include.sh || exit 1
source /physix/build.conf || exit 1
cd $SOURCE_DIR/$1 || exit 1

./configure --prefix=/usr --disable-static
chroot_check $? "libSSH2 : configure"
make
chroot_check $? "libSSH2 : make "
make install
chroot_check $? "libSSH2 : make install"

