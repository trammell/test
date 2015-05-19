
from pickle import load
from pprint import pprint

fh = open('pickle.dat','r')

pprint(load(fh))

