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

