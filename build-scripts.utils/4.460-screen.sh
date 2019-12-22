#!/bin/bash
source /physix/include.sh || exit 1
source /physix/build.conf || exit 1
cd /sources/$1 || exit 1

./configure --prefix=/usr                     \
            --infodir=/usr/share/info         \
            --mandir=/usr/share/man           \
            --with-socket-dir=/run/screen     \
            --with-pty-group=5                \
            --with-sys-screenrc=/etc/screenrc 
chroot_check $? "screen : configure"

sed -i -e "s%/usr/local/etc/screenrc%/etc/screenrc%" {etc,doc}/* 

make
chroot_check $? "screen : make"

make install &&
install -m 644 etc/etcscreenrc /etc/screenrc
chroot_check $? "screen : make install"

