#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (C) 2019 Travis Davies
source /mnt/physix/physix/include.sh || exit 1
cd $BR_SOURCE_DIR/$1 || exit 1
source ~/.bashrc

./configure --prefix=/tools
check $? "Sed: Configure"

make -j8
check $? "Sed: make"

make check
# not necessary and often returns non zero
check $? "Sed make check" NOEXIT

make install
check $? "Sed: make install"
