#!/usr/local/bin/python2.5

from sqlalchemy import create_engine
from sqlalchemy import MetaData, Column, Table
from sqlalchemy import Integer, String
from sqlalchemy import ForeignKey

engine = create_engine('sqlite:///tutorial.db', echo=True)

metadata = MetaData(bind=engine)

users = Table(
    'users',
    metadata,
    Column('id', Integer, primary_key=True),
    Column('name', String(40)),
    Column('age', Integer),
    Column('password', String),
)

addresses = Table(
    'addresses',
    metadata,
    Column('id', Integer, primary_key=True),
    Column('user_id',None,ForeignKey('users.id')),
    Column('email_address', String, nullable=False),
)

from sqlalchemy.sql import select

# simple select
s = select([users])
result = s.execute()
for row in result:
    print row

# fetch all rows
from pprint import pprint
conn = engine.connect()
result = conn.execute(s)
rows = result.fetchall()
pprint(rows)

# fetch one row
result = conn.execute(s)
row = result.fetchone()
pprint(row)

# select specific columns
s = select([users.c.name, users.c.age])
result = conn.execute(s)
pprint([r for r in result])

# select() example with constraint
s1 = select([users], users.c.id > 3)
print ">>> s1:", s1
result = conn.execute(s1)
pprint([r for r in result])

# select() example with conjunction
# FIXME: this query is currently broken
from sqlalchemy.sql import and_
conj = and_(users.c.name.like('T%'),users.c.age < 25)
print ">>> conj:", conj
s2 = s1.select(conj)
print ">>> s2:", s2

# result = conn.execute(s)      # FIXME
# pprint([r for r in result])
