#!/bin/bash

######################################################
# Hook script for executing the actual build of emote packs
######################################################

#VIRTUALENV=/home/wolfgang/tadaenv
#TADAPATH=/home/wolfgang/tada
#EMOTEPATH=/home/wolfgang/emotes
#WEBDIR=/var/www/emotes.cardboardbox.be

STARTDIR=`pwd`
WEBDIR=${EMOTE_WEBDIR:=$STARTDIR}

error_exit() {
    echo 'fail' > $STARTDIR/status.txt
    exit 1
}

trap 'error_exit' ERR

echo 'updating' > $STARTDIR/status.txt

# Update emotes
cd $EMOTE_PATH
git checkout master
git remote update
git pull --all

# Run Tada
python $EMOTE_TADAPATH/main.py -i $EMOTE_PATH -o $EMOTE_WEBDIR/output -n Ponypack

echo 'success' > $STARTDIR/status.txt
