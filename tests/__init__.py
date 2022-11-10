import unittest

from werkzeug.test import Client
from werkzeug.wrappers import BaseResponse

from lodgeit.application import db, make_app
from lodgeit.models import Paste
from json import loads


def is_json(response):
    """True if the response is JSON and the HTTP status was 200."""
    return (response.status_code == 200 and
            response.headers.get('Content-Type', '') == 'application/json')


def json(response):
    """The response parsed as JSON.

    No attempt is made to ensure the response is valid or even looks
    like JSON before parsing.
    """
    return loads(response.data)


class BaseTestCase(unittest.TestCase):
    def setUp(self):
        self.client = Client(
                make_app('sqlite://', 'NONE', False, True), BaseResponse)

    def teardown(self):
        Paste.query.delete()
        db.session.commit()
        db.session.remove()
        super().teardown()
