#!/bin/bash

######################################################
# Hook script for executing the actual build of emote packs
######################################################

VIRTUALENV=/home/wolfgang/tadaenv
TADAPATH=/home/wolfgang/tada
EMOTEPATH=/home/wolfgang/emotes
WEBDIR=/var/www/emotes.cardboardbox.be

error_exit() {
    cat 'failure' > status.txt
    exit 1
}

trap 'error_exit' ERR

cat 'updating' > status.txt

# Update emotes
cd $EMOTEPATH
git checkout master
git remote update
git pull --all

# Run Tada
$VIRTUALENV/bin/python $TADAPATH/main.py -i $EMOTEPATH -o $WEBDIR/output -n Ponypack

cat 'success' > status.txt