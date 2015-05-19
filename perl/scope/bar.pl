#!/usr/local/bin/perl -l
# $Id: bar.pl,v 1.1 2007/05/18 19:34:45 johnt Exp $

use strict;
use warnings;

{
    package Foo;
    my $foo = 'joy';
    sub blah { print "Foo: $foo" }
}

Foo->blah;
$Foo::foo = 'luck';
Foo->blah;

{
    package Bar;
    our $foo = 'joy';
    sub blah { print "Bar: $foo" }
}

Bar->blah;
$Bar::foo = 'luck';
Bar->blah;

