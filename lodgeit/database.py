"""
    lodgeit.database
    ~~~~~~~~~~~~~~~~

    Database fun :)

    :copyright: 2007-2010 by Armin Ronacher, Christopher Grebs.
    :license: BSD
"""
import sys
from types import ModuleType
import sqlalchemy
from sqlalchemy import MetaData
from sqlalchemy import orm
from lodgeit.local import application


metadata = MetaData()


def session_factory():
    options = {'autoflush': True, 'expire_on_commit': False}
    return orm.Session(application.engine, **options)


session = orm.scoped_session(session_factory)


class ModelBase(object):
    """Internal baseclass for all models.  It provides some syntactic
    sugar and maps the default query property.

    We use the declarative model api from sqlalchemy.
    """


# configure the declarative base
Model = orm.declarative_base(name='Model', cls=ModelBase, metadata=metadata)
ModelBase.query = session.query_property()


def _make_module():
    db = ModuleType('db')
    for mod in sqlalchemy, orm:
        for key, value in mod.__dict__.items():
            if not key.startswith('_'):
                setattr(db, key, value)

    db.session = session
    db.metadata = metadata
    db.Model = Model
    db.NoResultFound = orm.exc.NoResultFound
    return db


sys.modules['lodgeit.database.db'] = db = _make_module()
