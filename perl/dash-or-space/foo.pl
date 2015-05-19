#!/usr/bin/perl -l

use strict;
use warnings FATAL => 'all';

my $cc = "1234 5678 1234 5678";

$cc =~ s/[-\s]//g;  # sweet, \s works in character classes

print $cc;

