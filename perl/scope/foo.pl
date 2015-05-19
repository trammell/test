#!/usr/local/bin/perl -l
# $Id: foo.pl,v 1.1 2007/05/18 19:23:06 johnt Exp $

use strict;
use warnings;

{
    package Foo;
    my $foo = 'joy';
    our $foo = 'luck';
    sub blah { print "Foo: $foo $Foo::foo"; }
}

{
    package Bar;
    our $foo = 'luck';
    my $foo = 'joy';
    sub blah { print "Bar: $foo $Bar::foo"; }
}

Foo->blah;
Bar->blah;

