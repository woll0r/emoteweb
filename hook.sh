#!/bin/bash

######################################################
# Hook script for executing the actual build of emote packs
######################################################

VIRTUALENV=/home/wolfgang/tadaenv
TADAPATH=/home/wolfgang/tada
EMOTEPATH=/home/wolfgang/emotes
WEBDIR=/var/www/emotes.cardboardbox.be

# Update emotes
cd $EMOTEPATH
git remote update
git pull --all

for branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
    # Switch to branch
    git branch $branch

    # Run Tada
    $VIRTUALENV/bin/python $TADAPATH/main.py -i $EMOTEPATH -o $WEBDIR/output
done