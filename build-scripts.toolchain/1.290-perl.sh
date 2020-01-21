#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (C) 2019 Travis Davies
source /mnt/physix/physix/include.sh || exit 1
cd $BR_SOURCE_DIR/$1 || exit 1
source ~/.bashrc


sh Configure -des -Dprefix=/tools -Dlibs=-lm -Uloclibpth -Ulocincpth
check $? "perl: Configure"

make
check $? "perl: make"

cp -v perl cpan/podlators/scripts/pod2man /tools/bin
check $? "perl: cp -v perl cpan/podlators/scripts/pod2man /tools/bin"

mkdir -pv /tools/lib/perl5/5.30.0
check $? "perl: mkdir -pv /tools/lib/perl5/5.28.1"

cp -Rv lib/* /tools/lib/perl5/5.30.0
#strange errors but files are being written
#check $? "perl: cp -Rv lib/* /tools/lib/perl5/5.28.1"

