#!/usr/local/bin/perl -l
# $Id:$
# $Source:$

use strict;
use warnings FATAL => 'all';
use UNIVERSAL::can;

my %hash;
my $hashref = \%hash;

print ref($hashref);

eval { $hashref->can('foo'); };

{
    package Bar;
}

my $class = 'Bar';

#warn "invocant: ", UNIVERSAL::can::_is_invocant($class);


if ($class->can('new')) {
    warn "class $class can new()";
}
if (!$class->can('new')) {
    warn "class $class can not new()";
}


