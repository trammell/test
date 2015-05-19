#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2006/04/07 14:55:10 johnt Exp $

use strict;
use warnings;
use Data::Dumper;

my %hash = (
    foo => 1,
    bar => [ 3 .. 9 ],
);

print Data::Dumper->Dump([\%hash], [qw($foo{bar})]);


