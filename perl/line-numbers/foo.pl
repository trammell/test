#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:06:43 johnt Exp $

use strict;
use warnings;

print addln(<<"__STR__");
this
string
has
five
lines
__STR__


sub addln {
    my $i;
    (my $x = $_[0]) =~ s/^(.*)$/@{[ ++$i ]} $1/mg;
    return $x;
}

