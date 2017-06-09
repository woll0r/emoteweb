#!/usr/bin/env python
# -*- coding: utf-8 -*-

import bottle
import os
import subprocess
import json
import requests

runningpath = os.path.dirname(os.path.abspath(__file__))
staticroot = runningpath + '/static'
webpath = os.path.dirname('/var/www/emotes.cardboardbox.be/')

os.chdir(os.path.dirname(os.path.abspath(__file__)))

app = application = bottle.Bottle()


@app.route('/hook', method='POST')
def hook():
    data = bottle.request.json
    if data is None:
        bottle.abort(400, "Didn't receive proper input.")
    if bottle.request.get_header('X-Github-Event') is None:
        bottle.abort(400, "You're not someone I want to talk to")
    if bottle.request.get_header('X-Github-Event') is 'ping':
        return 'Pong!'
    else:
        #jsondata = {'version': data['commits'][0]['timestamp'], 'message': data['commits'][0]['message']}
        #with open('version.txt', 'w') as f:
        #    json.dump(jsondata, f)

        proc = subprocess.Popen(['sh', 'hook.sh'])
        return 'OK!'


@app.route('/')
def index():
    data = None
    #with open('version.txt', 'r') as f:
    #    data = json.load(f)

    res = requests.get('https://api.github.com/repos/XyyxShard/Ponysquad-Emote-Pack/git/refs/heads/master')

    commit = res.json()

    data = requests.get(commit['object']['url'])
    jsondata = data.json()

    version = jsondata['committer']['date']
    message = jsondata['message']
    message = message.split('\n')

    dirlist = os.listdir(os.path.join(webpath, 'output'))

    dirlist.sort()
    
    output = bottle.template('index', dirlist=dirlist, version=version, message=message)
    return output


@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root=staticroot)


if __name__ == '__main__':
    bottle.run(host='0.0.0.0')