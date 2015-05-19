#!/usr/local/bin/perl
use strict;
use warnings FATAL => 'all';

my $year = 1900 + (localtime())[5];

print "year=$year\n";

