#!/usr/bin/env python
# -*- coding: utf-8 -*-

import bottle
import os
import subprocess
import json

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
        return 'OK!'


@app.route('/')
def index():
    dirlist = os.listdir(os.path.join(webpath, 'output'))

    dirlist.sort()
    
    output = bottle.template('index', dirlist=dirlist)
    return output


@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root=staticroot)


if __name__ == '__main__':
    bottle.run(host='0.0.0.0')