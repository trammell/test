#!/usr/local/bin/perl -l
# $Id: bar.pl,v 1.2 2007/02/16 17:19:10 johnt Exp $

use strict;
use warnings;

srand($ARGV[0]) if @ARGV;

print int(rand(100)) for 1 .. 10;


