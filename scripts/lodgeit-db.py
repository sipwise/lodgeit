import os
import re
from sqlalchemy import create_engine, Table, Column, Integer, String, \
    ForeignKey, MetaData, DateTime, Boolean, Text
from datetime import datetime, timedelta
from sqlalchemy.sql import select, delete
from argparse import ArgumentParser, RawTextHelpFormatter



def get_args():
    """
    Parse arguments provided by user
    """
    def __default_db():
        if os.getenv('LODGEIT_DBURI'):
            return os.getenv('LODGEIT_DBURI')
        else:
            return 'sqlite:////tmp/lodgeit.db'

    parser = ArgumentParser(
        description=("Local operations with lodegit database which"
        "are not supported by API, ie delete pastes"),
        formatter_class=RawTextHelpFormatter
    )
    parser.add_argument(
        "-d", "--database",
        dest="dburi",
        action="store",
        default=__default_db(),
        help="Lodgeit database connect to. [default: %(default)s]",
    )
    parser.add_argument(
        "-a", "--action",
        dest="action",
        action="store",
        required=True,
        choices=["delete"],
        help="Action to accomplish on lodgeit DB.",
    )
    parser.add_argument(
        "-i", "--id",
        dest="id",
        action="store",
        help="Apply action to specific paste ID"
    )
    parser.add_argument(
        "--delta",
        dest="delta",
        action="store",
        help="Do action on pastes created during timeperiod. (h, d)",
        default="1d"
    )
    parser.add_argument(
        "--start",
        dest="start",
        action="store",
        help="Datetime starting from which pastes will be selected",
    )
    parser.add_argument(
        "--end",
        dest="end",
        action="store",
        help="Datetime until which pastes will be selected",
    )
    return parser.parse_args()


class Pastes(object):
    def __init__(self, uri):
        self.uri = uri
        self.session = self._create_session()
        self.pastes = Table('pastes', MetaData(),
            Column('paste_id', Integer, primary_key=True),
            Column('code', Text),
            Column(
                'parent_id',
                Integer,
                ForeignKey('pastes.paste_id'),
                nullable=True
            ),
            Column('pub_date', DateTime),
            Column('language', String(30)),
            Column('user_hash', String(40), nullable=True),
            Column('handled', Boolean),
            Column('private_id', String(40), unique=True, nullable=True)
        )

    @staticmethod
    def _delta_format(delta):
        """
        Parse provided delta and return timedelta prepared dictionary
        """
        delta_type = re.search(r'([0-9]{1,3})([d,h])', delta)
        if not delta_type:
            raise SystemError(
                "Delta has incorrect format."
            )
        if delta_type.group(2) == 'h':
            return {'hours': int(delta_type.group(1))}
        elif delta_type.group(2) == 'd':
            return {'days': int(delta_type.group(1))}

    def _create_session(self):
        """
        Create DB connection and return session
        """
        engine = create_engine(self.uri)
        session = engine.connect()
        return session

    def delete_by_date(self, start=str(), end=str(), delta="1d"):
        """
        Delete pastes which were created during provided timeframe
        """
        delta_args = self._delta_format(delta)
        if not start and not end:
            end = datetime.now() - timedelta(**delta_args)
            start = datetime.min
        elif start and not end:
            end = datetime.now()
        elif not start and end:
            start = end - timedelta(**delta_args)

        self.session.execute(
            self.pastes.delete().where(
                self.pastes.c.pub_date < end
            ).where(
                self.pastes.c.pub_date > start
            )
        )

    def delete_by_id(self, paste_id):
        """
        Delete pastes by public ID
        """
        self.session.execute(
            self.pastes.delete().where(
                self.pastes.c.paste_id == paste_id
            )
        )

def main():
    args = vars(get_args())
    pastes = Pastes(args['dburi'])
    if args['action'] == 'delete':
        if 'id' in args:
            pastes.delete_by_id(args['id'])
        else:
            pastes.delete_by_date(
                start=args['start'] if 'start' in args else str(),
                end=args['end'] if 'end' in args else str(),
                delta=args['delta'],
            )


if __name__ == "__main__":
    main()
