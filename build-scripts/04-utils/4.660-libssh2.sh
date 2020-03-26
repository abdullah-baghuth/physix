#!/bin/bash
source /opt/physix/include.sh || exit 1
source /opt/physix/build.conf || exit 1
cd $SOURCE_DIR/$1 || exit 1

su physix -c './configure --prefix=/usr --disable-static'
chroot_check $? "libSSH2 : configure"

su physix -c 'make'
chroot_check $? "libSSH2 : make "

make install
chroot_check $? "libSSH2 : make install"
