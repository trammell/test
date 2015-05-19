#!/usr/local/bin/perl
# $Id: foo.pl,v 1.5 2007/08/17 19:05:29 johnt Exp $

# some test code to explore how coderefs and globals interact

package main;
use strict;
use warnings;

{
    package Apple;
    our $NAME = "Apple";
    sub dump_name { print "name is: $NAME\n"; }
}

{
    package Banana;
    our $NAME = "Banana";
}

package main;

Apple::dump_name();    # prints Apple

*Banana::dump_name = \&Apple::dump_name;
Banana::dump_name();    # prints Apple

{
    local $Apple::NAME = $Banana::NAME;
    Banana::dump_name();    # prints "Banana"
}

Banana::dump_name();    # prints Apple

