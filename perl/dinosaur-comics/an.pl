#!/usr/bin/perl -l
# http://www.qwantz.com/index.php?comic=1663

use strict;
use warnings FATAL => 'all';

my $in = "12t 10o 8e 7a 6l 6n 6u 5i 5s 5d 5h 3i 3r 3f ww bb gkvcm";

$in =~ s/\s//g;

$in =~ s/(\d+)(\w)/$2 x $1/eg;


print $in;

