#!/usr/local/bin/perl
# $Id:$
# $Source:$

use strict;
use warnings FATAL => 'all';
use LWP::UserAgent;

my $ua = LWP::UserAgent->new(agent => "FooAgent/1.0");

print $ua;

