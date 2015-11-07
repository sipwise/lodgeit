# -*- coding: utf-8 -*-
"""
    lodgeit.models
    ~~~~~~~~~~~~~~

    Our database models.

    :copyright: 2010 by Christopher Grebs.
    :license: BSD.
"""
import time
import difflib
from datetime import datetime
from werkzeug import cached_property

from lodgeit import local
from lodgeit.utils import generate_paste_hash
from lodgeit.lib.highlighting import highlight, preview_highlight, LANGUAGES
from lodgeit.lib.diff import prepare_udiff
from lodgeit.database import db


class Paste(db.Model):
    __tablename__ = 'pastes'

    paste_id = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.Text)
    parent_id = db.Column(db.Integer, db.ForeignKey('pastes.paste_id'),
                          nullable=True)
    pub_date = db.Column(db.DateTime)
    language = db.Column(db.String(30))
    user_hash = db.Column(db.String(40), nullable=True)
    handled = db.Column(db.Boolean)
    private_id = db.Column(db.String(40), unique=True, nullable=True)

    children = db.relation('Paste', cascade='all',
                           primaryjoin=parent_id == paste_id,
                           backref=db.backref('parent', remote_side=[paste_id]))

    def __init__(self, code, language, parent_id=None, user_hash=None,
                 private=False):
        if language not in LANGUAGES:
            language = 'text'
        self.code = u'\n'.join(code.splitlines())
        self.language = language
        # TODO(dc): set these a bit more sanely, allowing two types is bad
        if parent_id:
            self.parent_id = parent_id
        self.pub_date = datetime.now()
        self.handled = False
        self.user_hash = user_hash
        self.private = private

    @staticmethod
    def get(identifier):
        """Return the paste for an identifier.  Private pastes must be loaded
        with their unique hash and public with the paste id.
        """
        if isinstance(identifier, basestring) and not identifier.isdigit():
            query = Paste.query.filter_by(private_id=identifier)
        else:
            query = Paste.query.filter_by(paste_id=int(identifier))
        return query.first()

    @staticmethod
    def find_all():
        """Return a query for all public pastes ordered by the id in reverse
        order.
        """
        return Paste.query.filter_by(
            private_id=None).order_by(Paste.paste_id.desc())

    @staticmethod
    def count():
        """Count all pastes."""
        return Paste.query.count()

    @staticmethod
    def resolve_root(identifier):
        """Find the root paste for a paste tree."""
        paste = Paste.get(identifier)
        if paste is None:
            return
        while paste.parent_id is not None:
            paste = paste.parent
        return paste

    @staticmethod
    def fetch_replies():
        """Get the new replies for the ower of a request and flag them
        as handled.
        """
        # TODO(dc): clean this query up to just return the ids
        ids = [x.paste_id for x in Paste.query.filter_by(
               user_hash=local.request.user_hash).all()]
        paste_list = Paste.query.filter(db.and_(
            Paste.parent_id.in_(ids),
            Paste.handled is False,
        )).order_by(Paste.paste_id.desc()).all()
        for paste in paste_list:
            paste.handled = True
        db.session.commit()
        return paste_list

    def _get_private(self):
        return self.private_id is not None

    def _set_private(self, value):
        if not value:
            self.private_id = None
        elif self.private_id is None:
            self.private_id = generate_paste_hash()

    private = property(_get_private, _set_private, doc='''
        The private status of the paste.  If the paste is private it gets
        a unique hash as identifier, otherwise an integer.
    ''')
    del _get_private, _set_private

    @property
    def identifier(self):
        """The paste identifier.  This is a string, the same the `get`
        method accepts.
        """
        if self.private:
            return self.private_id
        return str(self.paste_id)

    @property
    def url(self):
        """The URL to the paste."""
        return '/show/%s/' % self.identifier

    def compare_to(self, other, context_lines=4, template=False):
        """Compare the paste with another paste."""
        udiff = u'\n'.join(difflib.unified_diff(
            self.code.splitlines(),
            other.code.splitlines(),
            fromfile='Paste #%s' % self.identifier,
            tofile='Paste #%s' % other.identifier,
            lineterm='',
            n=context_lines
        ))
        if template:
            diff, info = prepare_udiff(udiff)
            return diff and diff[0] or None
        return udiff

    @cached_property
    def parsed_code(self):
        """The paste as rendered code."""
        linenos = local.request.args.get('linenos') != 'no'
        high = highlight(self.code, self.language, _linenos=linenos)
        return high

    def to_xmlrpc_dict(self):
        """Convert the paste into a dict for XMLRCP."""
        return {
            'paste_id':         self.paste_id,
            'code':             self.code,
            'parsed_code':      self.parsed_code,
            'pub_date':         int(time.mktime(self.pub_date.timetuple())),
            'language':         self.language,
            'parent_id':        self.parent_id,
            'url':              self.url
        }

    def render_preview(self, num=5):
        """Render a preview for this paste."""
        return preview_highlight(self.code, self.language, num)
