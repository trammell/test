#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:06:44 johnt Exp $

use strict;
use warnings;

my $input = "This
is
a
test
of the
emergency
broad
cast
sys
tem.\n";

# drat, doesn't work

close(STDIN);
open(STDIN, "<", \$input) or die "Can't reopen STDIN: $!";

while (<>) {
    print "$ARGV $. $_";
    last if $. > 10;
}

