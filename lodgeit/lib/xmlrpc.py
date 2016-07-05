# -*- coding: utf-8 -*-
"""
    lodgeit.lib.xmlrpc
    ~~~~~~~~~~~~~~~~~~

    XMLRPC helper stuff.

    :copyright: 2007 by Armin Ronacher.
    :license: BSD
"""
import re
from SimpleXMLRPCServer import SimpleXMLRPCDispatcher
from werkzeug import Response
from lodgeit import local


_strip_re = re.compile(r'[\x00-\x08\x0B-\x1F]')


class XMLRPCRequestHandler(SimpleXMLRPCDispatcher):

    def __init__(self):
        SimpleXMLRPCDispatcher.__init__(self, True, 'utf-8')

    def handle_request(self):
        def dispatch(method_name, params):
            rv = self.funcs[method_name](*params)
            if rv is None:
                rv = False
            return rv
        response = self._marshaled_dispatch(local.request.data, dispatch)
        return Response(_strip_re.sub('', response), mimetype='text/xml')
