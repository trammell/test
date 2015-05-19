#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:03:31 johnt Exp $

use strict;
use warnings;
use diagnostics;

$^L = 1;

my $c = sub { print 'foo' };

sub _bar { print 'bar' }

*main::foo = $c;
*main::bar = \&_bar;

#foo();
#bar();

