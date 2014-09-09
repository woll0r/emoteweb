#!/bin/bash

######################################################
# Hook script for executing the actual build of emote packs
######################################################

VIRTUALENV=/home/wolfgang/tadaenv
TADAPATH=/home/wolfgang/tada
EMOTEPATH=/home/wolfgang/emotes
WEBDIR=/var/www/emotes.cardboardbox.be

# Update emotes
cd $EMOTEPATH/input
git pull

# Run Tada
cd $EMOTEPATH
mkdir output
$VIRTUALENV/bin/python $TADAPATH/main.py

# Move output over here
mv $EMOTEPATH/output $WEBDIR/