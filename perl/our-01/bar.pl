#!/usr/local/bin/perl
# $Id: bar.pl,v 1.1 2007/05/18 03:29:07 johnt Exp $

use strict;
use warnings;

{
    package Foo;
    our $DEBUG = 0;
    sub huh { warn "\$Foo::DEBUG = $DEBUG\n" }
}

{
    package Bar;
    use base 'Foo';
    sub huh { warn "\$Bar::DEBUG = $Bar::DEBUG\n" }
}

$_->huh for qw( Foo Bar );

$Foo::DEBUG = 1;

$_->huh for qw( Foo Bar );

$Bar::DEBUG = 2;

