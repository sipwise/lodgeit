#!/usr/bin/env python

import argparse
import code

from werkzeug.serving import run_simple
from werkzeug.test import create_environ, run_wsgi_app

from lodgeit import local
from lodgeit.application import make_app
from lodgeit.database import db

dburi = 'sqlite:////tmp/lodgeit.db'

SECRET_KEY = 'no secret key'


def run_app(app, path='/'):
    env = create_environ(path)
    return run_wsgi_app(app, env)


def action_runserver(args):
    app = make_app(dburi, SECRET_KEY, debug=True)
    run_simple(args.hostname, args.port, app,
               use_reloader=args.reloader)


def action_shell(args):
    namespace = {
        'app': make_app(dburi, SECRET_KEY, False, True),
        'local': local,
        'db': db,
        'run_app': run_app
    }
    banner = ('\nWelcome to the interactive shell environment of LodgeIt!\n'
              '\n'
              'You can use the following predefined objects: app, local, db.\n'
              'To run the application (creates a request) use *run_app*.')
    code.interact(banner, local=namespace)


def main():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='action', required=True)

    runserver = subparsers.add_parser('runserver',
                                      help='start the development server')
    runserver.add_argument('--hostname', default='localhost')
    runserver.add_argument('--port', type=int, default=5000)
    runserver.add_argument('--no-reloader', dest='reloader',
                           action='store_false')
    runserver.set_defaults(func=action_runserver)

    shell = subparsers.add_parser('shell',
                                  help='start a development shell')
    shell.set_defaults(func=action_shell)

    args = parser.parse_args()
    args.func(args)


if __name__ == '__main__':
    main()
