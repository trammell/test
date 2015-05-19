#!/usr/bin/env python

from datetime import datetime, timedelta

minutes = 90
delta = timedelta(seconds=minutes*60)
print "delta: %s" % delta

now = datetime.now()
print "now: %s" % now

later = now + delta
print "later: %s" % later

earlier = now - delta
print "earlier: %s" % earlier

