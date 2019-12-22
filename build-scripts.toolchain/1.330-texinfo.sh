#!/bin/bash                                                                    
# SPDX-License-Identifier: MIT
# Copyright (C) 2019 Travis Davies
source ../../physix/include.sh || exit 1
cd $BUILDROOT/sources/$1 || exit 1
source ~/.bashrc                        


./configure --prefix=/tools
check $? "Texinfo: Configure"

make -j8 
check $? "texingo: make"

make check
# Not necessary
check $? "texinfo: make check" noexit

make install
check $? "Texinfo: make install"

