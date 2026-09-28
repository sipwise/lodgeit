import os
from unittest import mock

from tests import BaseTestCase


class URLTestCase(BaseTestCase):
    def test_get_urls(self):
        rules = [
            ('/', 200),
            ('/all/', 200),
            ('/all/1/', 200),
            ('/xmlrpc/', 200),
            ('/json/', 200),
            ('/about/', 200),
            ('/help/', 200),
            ('/help/advanced/', 200),
            ('/help/api/', 200),
            ('/help/integration/', 200),
            ('/help/pasting/', 200),
            ('/language/de/', 302),
            ('/language/en/', 302),
            ]
        for rule, code in rules:
            resp = self.client.get(rule)
            assert code == resp.status_code

    def test_post_url(self):
        resp = self.client.post('/')
        assert 200 == resp.status_code

    def test_request_is_context_local(self):
        from werkzeug.local import LocalProxy
        from lodgeit import local

        self.client.get('/')
        # binding a request must not replace the module level proxy
        assert isinstance(vars(local)['request'], LocalProxy)

    def test_pool_recycle_from_environment(self):
        from lodgeit.application import make_app

        with mock.patch.dict(os.environ, {'LODGEIT_POOL_RECYCLE': '60'}):
            app = make_app('sqlite://', 'NONE', False, True)
        assert 60 == app.engine.pool._recycle
