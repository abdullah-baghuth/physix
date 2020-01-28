#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (C) 2019 Travis Davies
source /mnt/physix/physix/include.sh || exit 1
cd $BR_SOURCE_DIR/$1 || exit 1
source ~/.bashrc


./configure --disable-shared
check $? "gettext: Configure"

make
check $? "gettext make"

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /tools/bin
