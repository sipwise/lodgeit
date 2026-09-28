from werkzeug.test import Client
from werkzeug.wrappers import Response

from tests import BaseTestCase

NOTIFICATION = b'Someone Replied To Your Paste'


class RepliesTestCase(BaseTestCase):
    def new_paste(self, client, **data):
        data.setdefault('language', 'text')
        resp = client.post('/', data=data)
        assert 302 == resp.status_code
        return resp.headers['Location'].split('/')[-2]

    def test_reply_notification(self):
        paste_id = self.new_paste(self.client, code='hello')
        other = Client(self.client.application, Response)
        self.new_paste(other, code='hello world', parent=paste_id)

        # the owner of the parent paste is notified once
        resp = self.client.get('/show/%s/' % paste_id)
        assert NOTIFICATION in resp.data
        resp = self.client.get('/show/%s/' % paste_id)
        assert NOTIFICATION not in resp.data

    def test_no_notification_for_others(self):
        paste_id = self.new_paste(self.client, code='hello')
        other = Client(self.client.application, Response)
        self.new_paste(other, code='hello world', parent=paste_id)

        resp = other.get('/show/%s/' % paste_id)
        assert NOTIFICATION not in resp.data
