#!/bin/bash

chroot "/mnt/physix/" /usr/bin/env -i HOME=/root  TERM="$TERM" \
        PS1='(physix base chroot) \u:\w\$ '                    \
        PATH=/bin:/usr/bin:/sbin:/usr/sbin                     \
        /bin/bash --login 

