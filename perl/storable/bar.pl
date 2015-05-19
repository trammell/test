#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2006/06/09 18:13:26 johnt Exp $

use strict;
use warnings;
use Storable qw/ freeze nfreeze / ;

my $foo = {
    this => 'is',
    a => [ qw / hash containing / ],
    quite => 'a',
    few => [ 'values' ],
};

my $bar = [ 1 .. 10 ];

sub title { print "---------- @_ ----------\n" }

title('freeze');
print freeze($foo);
title('nfreeze');
print nfreeze($foo);
title('nfreeze2');
print nfreeze($bar);
