#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2007/08/17 19:05:29 johnt Exp $

use strict;
use warnings;


if ("a" =~ /[[:alpha:]]/) {
    print "ok"
}

if ("a" =~ /[[:^alpha:]]/) {
    print "not ok"
}




