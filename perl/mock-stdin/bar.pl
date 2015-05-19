#!/usr/local/bin/perl
# $Id: bar.pl,v 1.1 2007/08/17 19:06:43 johnt Exp $

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

open(INPUT, "<", \$input) or die "Can't open in-memory filehandle: $!";

print <INPUT>;

close(STDIN);
open(STDIN, "&<INPUT");

# drat, doesn't work

while (<>) {
    print "$ARGV $. $_";
    last if $. > 10;
}

