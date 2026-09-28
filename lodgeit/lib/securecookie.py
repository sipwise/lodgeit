"""
    lodgeit.lib.securecookie
    ~~~~~~~~~~~~~~~~~~~~~~~~

    A signed cookie based session.  This replaces the
    `werkzeug.contrib.securecookie` module which was removed in
    Werkzeug 1.0.  The data is serialized as JSON and signed by
    itsdangerous so the client can read but not modify it.

    :license: BSD
"""
from itsdangerous import BadData, URLSafeSerializer
from werkzeug.datastructures import CallbackDict


class SecureCookie(CallbackDict):
    """A dict that is stored in a signed cookie.  Modifications are
    tracked so the cookie only has to be sent again if it changed.
    """

    def __init__(self, data=None, secret_key=None):
        def on_update(self):
            self.modified = True
        CallbackDict.__init__(self, data, on_update)
        self.secret_key = secret_key
        self.modified = False

    @property
    def should_save(self):
        """True if the session was modified and should be saved."""
        return self.modified

    @staticmethod
    def _get_serializer(secret_key):
        return URLSafeSerializer(secret_key, salt='lodgeit-session')

    def serialize(self):
        """Serialize the session into a signed string."""
        if self.secret_key is None:
            raise RuntimeError('no secret key defined')
        return self._get_serializer(self.secret_key).dumps(dict(self))

    @classmethod
    def unserialize(cls, string, secret_key):
        """Load the session from a signed string.  If the signature is
        invalid or the data is malformed an empty session is returned.
        """
        try:
            data = cls._get_serializer(secret_key).loads(string)
        except BadData:
            data = None
        if isinstance(data, dict):
            return cls(data, secret_key)
        return cls(secret_key=secret_key)

    @classmethod
    def load_cookie(cls, request, key='session', secret_key=None):
        """Load the session from the cookie `key` of `request`."""
        data = request.cookies.get(key)
        if not data or secret_key is None:
            return cls(secret_key=secret_key)
        return cls.unserialize(data, secret_key)

    def save_cookie(self, response, key='session', expires=None, **kwargs):
        """Store the session in the cookie `key` of `response`."""
        response.set_cookie(key, self.serialize(), expires=expires, **kwargs)
