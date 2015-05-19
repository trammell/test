#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:05:29 johnt Exp $

use strict;
use warnings;

my $queue = q( a b c d e f g );

my $n = scalar( @_ = split q( ), $queue );

print "Got $n elements\n";

my $x = scalar( my @x = split q( ), $queue );

print "Got $x elements\n";
