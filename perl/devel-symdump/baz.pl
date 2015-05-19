#!/usr/local/bin/perl
# $Id: baz.pl,v 1.2 2007/09/17 20:18:43 johnt Exp $

use strict;
use warnings;
use Data::Dumper;

warn "Perl version is '$]'\n";

{
    package Foo;
    our $x = undef;
    our @x = qw( alpha beta gamma );
}

{
    package Bar;
    our @x = qw( alpha beta gamma );
}

symdump('Foo','x');
symdump('Bar','x');

sub symdump {
    my ($pkg, $symbol) = @_;
    local(*SYM) = do {
        no strict 'refs';
        ${*{"$pkg\::"}}{$symbol};
    };
    foreach my $slot (qw( SCALAR ARRAY HASH )) {
        warn Data::Dumper->Dump( [*SYM{$slot}], [ "\${ \*{\$$pkg\::{$symbol}}{$slot} }" ] );
    }
}

__END__

Perl version is '5.008005'
${ *{$Foo::{x}}{SCALAR} } = \undef;
${ *{$Foo::{x}}{ARRAY} } = [
                             'alpha',
                             'beta',
                             'gamma'
                           ];
${ *{$Foo::{x}}{HASH} } = undef;
${ *{$Bar::{x}}{SCALAR} } = \undef;
${ *{$Bar::{x}}{ARRAY} } = [
                             'alpha',
                             'beta',
                             'gamma'
                           ];
${ *{$Bar::{x}}{HASH} } = undef;
