#! /bin/sh
#
# update.sh
# Copyright (C) 2016 Register <registerdedicated(at)gmail.com>
#
# Distributed under terms of the GPLv3 license.
#

filepath=`cd $(dirname $0); pwd`/hosts
#remotefile=https://raw.githubusercontent.com/racaljk/hosts/master/hosts
remotefile=https://coding.net/u/scaffrey/p/hosts/git/raw/master/hosts
tmpfile=/tmp/remote-hosts

if [ -f $tmpfile ]; then
    exit 0
else
    curl -fLo $tmpfile $remotefile; sed -e '1,13'd $tmpfile > $tmpfile.new
    diff -r $tmpfile.new $filepath > /dev/null
    if [ $? -eq 0 ]; then
        rm $tmpfile{,.new}
    else
        cp -f $tmpfile.new $filepath
        rm $tmpfile{,.new}
    fi
fi
