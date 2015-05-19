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

# create tables in database
metadata.create_all()

# insert a row
ins = users.insert()
new_user = ins.values(name="Joe", age=20, password="pass")
conn = engine.connect()
conn.execute(new_user)

# insert a row without a connection object
ins = users.insert()
result = engine.execute(ins, name="Shinji", age=15, password="nihongo")

# another way to insert a row without a connection object
result = users.insert().execute(name="Martha",age=45,password="dingbat")

# insert multiple rows
conn.execute(
    users.insert(),
    [
        { "name": "Ted",     "age": 10, "password":"dink" },
        { "name": "Asahina", "age": 25, "password":"nippon" },
        { "name": "Evan",    "age": 40, "password":"macaca" },
    ],
)

