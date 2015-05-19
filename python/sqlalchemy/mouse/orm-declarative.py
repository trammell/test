#!/usr/local/bin/python2.5

from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import backref, mapper, relation

Base = declarative_base()

class User(Base):

    __tablename__ = 'users'
    id = Column(Integer,primary_key=True)
    name = Column(String)
    fullname = Column(String)
    password = Column(String)

    def __init__(self,name,fullname,password):
        self.name = name
        self.fullname = fullname
        self.password = password

    def __repr__(self):
        id_ = self.id or 0
        tpl = (id_,self.name,self.fullname,self.password)
        return "<User(0x%02x,'%s','%s','%s')>" % tpl

class Address(Base):
    __tablename__ = 'addresses'
    id = Column(Integer,primary_key=True)
    email_address = Column(String,nullable=False)
    user_id = Column(Integer, ForeignKey('users.id'))

    # create a one-to-many relationship (one user, many addresses)

    user = relation(User, backref=backref('addresses', order_by=id))

    def __init__(self,email_address):
        self.email_address = email_address

    def __repr__(self):
        return "<Address('%s')>" % self.email_address

# create a connection to a sqlite database
engine = create_engine('sqlite:///tutorial.db',echo=True)

# get the User table object
users = User.__table__

# construct schema metadata object
metadata = Base.metadata
metadata.create_all(engine)

# construct a user

mike = User("mike","Mike Driscoll","password")
print "user object: %s" % mike

mike.fullname = "Mike Dryskull"
print "updated user object: %s" % mike

# add a user to the session (transaction commit pending)

from sqlalchemy.orm import sessionmaker
from pprint import pprint

Session = sessionmaker(bind=engine)
session = Session()
session.add(mike)
pprint(session.new)


# add multiple users and commit the transaction
session.add_all([
    User('Mary','Mary Wonka','candy'),
    User('Sue','Sue Lawhead','12345'),
    User('Fay','Fay Wray','banana'),
])
pprint(session.new)
pprint(session.dirty)
session.commit()

# fix the 'mike' object, and see if session.dirty reflects the change
mike.fullname = "Mike Driscoll"
print "===== Dirty? ====="
pprint(session.dirty)

# select all
all_users = session.query(User).all()
pprint(all_users)

# select with filter
just_mike = session.query(User).filter_by(name="mike").first()
pprint(just_mike)

# select with IN (...) clause
mary_fay = session.query(User).filter(User.name.in_(['Mary','Fay'])).all()
pprint(mary_fay)

# select with sort
ordered = session.query(User).order_by(User.id)
pprint([x for x in ordered])

# some join examples

prof = User("Prof", "Professor Xavier", "earlgrey")
print "addresses:"
pprint(prof.addresses)
session.add(prof)

prof.addresses = [
    Address(email_address='profx@dc.com'),
    Address(email_address='xavier@yahoo.com'),
]

prof.addresses[0].email_address = 'profx@marvel.com'
pprint(prof.addresses)
session.commit()

# yoinks!
print "========== long query =========="
for u, a in session.query(User,Address).filter(User.id==Address.user_id).filter(Address.email_address=='xavier@yahoo.com').all():
    print "join 1:", u, a

# rewriting for clarity?
print "========== rewrite =========="
sql = session.query(User, Address)
sql = sql.filter(User.id==Address.user_id)
sql = sql.filter(Address.email_address=='xavier@yahoo.com')
for u, a in sql.all():
    print "join 2:", u, a


# a real join!
print "========== a real join =========="
from sqlalchemy.orm import join
result = session.query(User).select_from(join(User,Address)).filter(Address.email_address=='xavier@yahoo.com').all()
pprint(result)

