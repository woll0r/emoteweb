#!/usr/bin/env python
# -*- coding: utf-8 -*-

import bottle
import os
import subprocess

runningpath = os.path.dirname(os.path.abspath(__file__))
staticroot = runningpath + '/static'

os.chdir(os.path.dirname(os.path.abspath(__file__)))

app = application = bottle.Bottle()


@app.route('/hook', method='POST')
def hook():
    data = bottle.request.json
    if data is None:
        bottle.abort(400, "Didn't receive proper input.")
    if bottle.request.get_header('X-Github-Event') is None:
        bottle.abort(400, "You're not someone I want to talk to")
    with open('version.txt', 'w') as f:
        f.write(data['commit'][0]['timestamp'])

    proc = subprocess.Popen(['sh', 'hook.sh'])

    return 'OK!'


@app.route('/')
def index():
    version = ''
    with open('version.txt', 'r') as f:
        version = f.readline()
    output = bottle.template('index', version=version)
    return output


@app.route('/static/<filepath:path>')
def server_static(filepath):
    return bottle.static_file(filepath, root=staticroot)


if __name__ == '__main__':
    bottle.run(host='0.0.0.0')