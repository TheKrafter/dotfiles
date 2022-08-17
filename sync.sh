#!/usr/bin/env bash

# Copy files from ~/.config and others (where specified) for uploading to a git repo
## VARIABLES
configsync_configdir=$HOME/.config # where stuff goes in the local system
configsync_destdir=$HOME/GitHub/dotfiles # where the git repo is
##
if [ '$1' == 'sync' ];
then
    echo -n "Ensuring $configsync_destdir exists..."
    mkdir -p $configsync_destdir && echo " Done."
    echo -n "Copying files from $configsync_configdir..."
    cp -ru $configsync_configdir/ $configsync_destdir/ && echo "Done."
elif [ '$1' == 'install' ];
then
    echo -n "Checking git repo exists..."
    if [ $(cat $configsync_destdir/.git/config | grep "[core]") == "[core]" ];
    then
        echo "Success."
    else
        echo "Fail."
        exit 1
    fi
    echo -n "Copying files from $configsync_destdir/.config to $configsync_configdir"
    mkdir -p $configsync_configdir/
    cp -r $configsync_destdir/.config/* $configsync_configdir/*
else
    echo "Usage:"
    echo "    ./sync.sh [sync|install]"
fi
exit 0



