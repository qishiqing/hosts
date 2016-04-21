#! /bin/sh
#
# update.sh
# Copyright (C) 2016 Register <registerdedicated(at)gmail.com>
#
# Distributed under terms of the GPLv3 license.
#

filepath=`cd $(dirname $0); pwd`/hosts
remotefile=https://raw.githubusercontent.com/racaljk/hosts/master/hosts
tmpfile=/tmp/remote-hosts

if [ -f $tmpfile ]; then
    exit 0
else
    curl -fLo $tmpfile $remotefile
    diff -r $tmpfile ${filepath} > /dev/null
    if [ $? -eq 0 ]; then
        rm $tmpfile
    else
        cp -f $tmpfile ${filepath}
        rm $tmpfile
    fi
fi
