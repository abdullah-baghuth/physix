#!/bin/bash
source /opt/physix/include.sh || exit 1
cd $SOURCE_DIR/$1 || exit 1

sed -i 's/\(__atomic_compare_exchange\)/\1_db/' src/dbinc/atomic.h

su physix -c 'cd build_unix          &&
../dist/configure --prefix=/usr      \
                  --enable-compat185 \
                  --enable-dbm       \
                  --disable-static   \
                  --enable-cxx'
chroot_check $? "BerkeleyDB : configure"

su physix -c 'cd build_unix && make'
chroot_check $? "BerkeleyDB : make"

cd build_unix
make docdir=/usr/share/doc/db-5.3.28 install
chroot_check $? "BerkeleyDB : make docs"

chown -v -R root:root                        \
      /usr/bin/db_*                          \
      /usr/include/db{,_185,_cxx}.h          \
      /usr/lib/libdb*.{so,la}                \
      /usr/share/doc/db-5.3.28
chroot_check $? "BerkeleyDB : chown of db fiels"
