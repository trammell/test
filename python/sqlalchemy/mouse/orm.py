#!/usr/local/bin/python2.5

from sqlalchemy import create_engine
from sqlalchemy import Column, MetaData, Table
from sqlalchemy import Integer, String, ForeignKey
from sqlalchemy.orm import mapper, sessionmaker


class User(object):

    def __init__(self,name,fullname,password):
        self.name = name
        self.fullname = fullname
        self.password = password

    def __repr__(self):
        tpl = (self.name,self.fullname,self.password)
        return """<User('%s','%s','%s')>""" % tpl


# create a connection to a sqlite database
engine = create_engine('sqlite:///tutorial.db',echo=True)

# construct schema metadata object
metadata = MetaData()

# construct tables
users = Table(
    'users',
    metadata,
    Column('user_id', Integer, primary_key=True),
    Column('name', String),
    Column('fullname', String),
    Column('password', String),
)

email = Table(
    'email',
    metadata,
    Column('email_id', Integer, primary_key=True),
    Column('email_address',String),
    Column('user_id', Integer, ForeignKey('users.user_id')),
)

metadata.create_all(engine)
mapper(User,users)

