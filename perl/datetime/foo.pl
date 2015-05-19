#!/usr/local/bin/perl
use strict;
use warnings FATAL => 'all';
use DateTime;


my $dt = DateTime->now->add( days => 30 + int(rand(30)));
print $dt, "\n";


