import os
import shutil
import sys
import tempfile
import unittest
from datetime import datetime
from unittest import mock

from sqlalchemy import create_engine

from lodgeit.cmd import managedb
from lodgeit.models import Paste


class ManageDBTestCase(unittest.TestCase):
    def setUp(self):
        self.tmpdir = tempfile.mkdtemp()
        self.dburi = 'sqlite:///' + os.path.join(self.tmpdir, 'lodgeit.db')
        self.engine = create_engine(self.dburi)
        Paste.__table__.create(self.engine)
        with self.engine.begin() as conn:
            for paste_id, day in (1, 1), (2, 2), (3, 3):
                conn.execute(Paste.__table__.insert().values(
                    paste_id=paste_id, code='paste %d' % paste_id,
                    language='text', handled=False,
                    pub_date=datetime(2026, 1, day, 12)))

    def tearDown(self):
        self.engine.dispose()
        shutil.rmtree(self.tmpdir)

    def run_managedb(self, *args):
        argv = ['lodgeit-managedb', '-d', self.dburi, '-a', 'delete']
        with mock.patch.object(sys, 'argv', argv + list(args)):
            managedb.main()
        with self.engine.connect() as conn:
            rows = conn.execute(Paste.__table__.select().order_by(
                Paste.__table__.c.paste_id))
            return [row.paste_id for row in rows]

    def test_delete_by_id(self):
        assert [1, 3] == self.run_managedb('-i', '2')

    def test_delete_by_date(self):
        assert [1, 3] == self.run_managedb('--start', '2026-01-02',
                                           '--end', '2026-01-03')

    def test_delete_by_end_and_delta(self):
        assert [1, 3] == self.run_managedb('--end', '2026-01-02 13:00',
                                           '--delta', '1d')
