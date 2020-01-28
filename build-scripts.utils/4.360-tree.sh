#!/bin/bash
source /physix/include.sh || exit 1
cd $SOURCE_DIR/$1 || exit 1

su physix -c 'make'
chroot_check $? "tree : make"

make MANDIR=/usr/share/man/man1 install &&
chmod -v 644 /usr/share/man/man1/tree.1
chroot_check $? "tree : make install"
