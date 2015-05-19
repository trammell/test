#!/usr/local/bin/perl
# $Id: bar.pl,v 1.1 2007/09/17 20:17:48 johnt Exp $

use strict;
use warnings;

warn "Perl version is '$]'\n";

{
    package Foo;
    use Data::Dumper;
    our $s1 = 'foo';
    our $s2 = undef;
    our @a  = qw( foo bar baz );
    *s1glob = $Foo::{s1};
    *s2glob = $Foo::{s2};
    *aglob  = $Foo::{a};
    for (*s1glob, *s2glob, *aglob) {
        for my $slot (qw( SCALAR ARRAY HASH IO CODE )) {
            print "${_}{$slot} => ", Dumper(*{$_}{$slot});
        }
    }
}

{
    package main;
    use Devel::Symdump;
    for (qw( scalars arrays hashes)) {
        print "$_ => ";
        local $, = q(,);
        print Devel::Symdump->$_('Foo');
        print "\n";
    }
}

__END__

*Foo::s1{SCALAR} => $VAR1 = \'foo';
*Foo::s1{ARRAY} => $VAR1 = undef;
*Foo::s1{HASH} => $VAR1 = undef;
*Foo::s1{IO} => $VAR1 = undef;
*Foo::s1{CODE} => $VAR1 = undef;
*Foo::s2{SCALAR} => $VAR1 = \undef;
*Foo::s2{ARRAY} => $VAR1 = undef;
*Foo::s2{HASH} => $VAR1 = undef;
*Foo::s2{IO} => $VAR1 = undef;
*Foo::s2{CODE} => $VAR1 = undef;
*Foo::a{SCALAR} => $VAR1 = \undef;
*Foo::a{ARRAY} => $VAR1 = [
          'foo',
          'bar',
          'baz'
        ];
*Foo::a{HASH} => $VAR1 = undef;
*Foo::a{IO} => $VAR1 = undef;
*Foo::a{CODE} => $VAR1 = undef;
scalars => Foo::s1,Foo::a,Foo::s1glob,Foo::aglob,Foo::Dumper,Foo::s2,Foo::BEGIN,Foo::s2glob
arrays => Foo::a,Foo::aglob
hashes => 

