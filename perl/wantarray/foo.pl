#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:03:48 johnt Exp $

use strict;
use warnings;

sub foo {
    return ( 8 , 9, 10, 11, 12 )
}

my $x = foo();
my ($y) = foo();
my $z = scalar foo();
my $b = my @a = foo();

print "$x $y $z @a $b \n";

