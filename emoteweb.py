#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""A simple webpage to host emotes and automatically convert when the upstream
emote repository gets updated"""

import os
import subprocess

import bottle
import requests

import json

runningpath = os.path.dirname(os.path.abspath(__file__))
staticroot = runningpath + '/static'
#webpath = os.path.dirname('/var/www/emotes.cardboardbox.be/')
if "EMOTE_WEBPATH" in os.environ:
    webpath = os.path.dirname(os.getenv("EMOTE_WEBPATH"))
else:
    webpath = runningpath + '/output'

os.chdir(os.path.dirname(os.path.abspath(__file__)))

app = application = bottle.Bottle()


@app.route('/hook', method='POST')
def hook():
    """Hook that launches the emote conversion when the repo is updated"""
    data = bottle.request.json
    if data is None:
        bottle.abort(400, "Didn't receive proper input.")
    if bottle.request.get_header('X-Github-Event') is None:
        bottle.abort(400, "You're not someone I want to talk to")
    if bottle.request.get_header('X-Github-Event') is 'ping':
        return 'Pong!'
    else:
        proc = subprocess.Popen(['sh', 'hook.sh'])
        return 'OK!'


@app.route('/')
def index():
    """Show the list of emote packs available together with some other info"""

    with open('status.txt', 'r') as f:
        status = f.read().replace('\n', '')

    githubrepo = os.getenv("EMOTE_REPO")

    #res = requests.get('https://api.github.com/repos/' +
    #                   githubrepo +
    #                   '/git/refs/heads/master')

    #commit = res.json()

    #data = requests.get(commit['object']['url'])
    #jsondata = data.json()

    with open('commit.json', 'r') as j:
        jsondata = json.load(j)

    version = jsondata['committer']['date']
    message = jsondata['message']
    message = message.split('\n')

    dirlist = os.listdir(os.path.join(webpath, 'output'))

    dirlist.sort()

    output = bottle.template('index',
                             dirlist=dirlist,
                             version=version,
                             message=message,
                             status=status,
                             githubrepo=githubrepo)
    return output


@app.route('/static/<filepath:path>')
def server_static(filepath):
    """Return static files"""
    return bottle.static_file(filepath, root=staticroot)

@app.route('/output/<filepath:path>')
def server_output(filepath):
    """Return emote pack from output folder if in the same folder"""
    return bottle.static_file(filepath, root=webpath)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
