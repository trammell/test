#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use Storable qw/store nstore/;

my $x = {
    this => 'is',
    a => [ qw / hash containing / ],
    quite => 'a',
    few => [ 'values' ],
};

store($x, 'st.txt');
nstore($x, 'nst.txt');
