#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:06:44 johnt Exp $

use strict;
use warnings;


my %valid = ( foo => 1 );


{
    package One;
    use Params::Validate ':all';
    validation_options( allow_extra => 1 );
    local @_ = ( foo => 'bar', baz => 'quux' );
    my %args = validate( @_, \%valid );
}

{
    package Two;
    use Params::Validate ':all';
    validation_options( allow_extra => 1 );
    our %tmp = ( foo => 'bar', baz => 'quux' );
    my %args = validate( @{[ %tmp ]}, \%valid );
}

