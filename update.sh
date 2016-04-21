#! /bin/sh
#
# update.sh
# Copyright (C) 2016 Register <registerdedicated(at)gmail.com>
#
# Distributed under terms of the GPLv3 license.
#

filepath=`cd $(dirname $0); pwd`
remotefile=https://raw.githubusercontent.com/racaljk/hosts/master/hosts
tmpfile=/tmp/remote-hosts

if [ -f $tmpfile ]; then
    exit 0
else
    curl -fLo $tmpfile $remotefile
    cp -f $tmpfile ${filepath}/hosts
    rm $tmpfile
fi
