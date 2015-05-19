#!/usr/local/bin/perl
# $Id: foo.pl,v 1.3 2007/09/14 21:11:38 johnt Exp $

use strict;
use warnings;

{
    package Foo;
    our $scalar = 'foo';
    our @array = qw( foo bar baz );
    our %hash = ( foo => 'bar', baz => 'quux');
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

{
    package Bar;
    use Data::Dumper;
    our $s = 'scalar';
    our @a = qw( a r r a y );
    our %h = qw( h a s h );

    *sglob = $Bar::{s};
    *aglob = $Bar::{a};
    *hglob = $Bar::{h};

    for (*sglob, *aglob, *hglob) {
        for my $slot (qw( SCALAR ARRAY HASH IO CODE )) {
            print "${_}{$slot} => ", Dumper( *{$_}{$slot} );
        }
    }
}

__END__

scalars => Foo::scalar,Foo::array,Foo::hash
arrays => Foo::array
hashes => Foo::hash
*Bar::s{SCALAR} => $VAR1 = \'scalar';
*Bar::s{ARRAY} => $VAR1 = undef;
*Bar::s{HASH} => $VAR1 = undef;
*Bar::s{IO} => $VAR1 = undef;
*Bar::s{CODE} => $VAR1 = undef;
*Bar::a{SCALAR} => $VAR1 = \undef;
*Bar::a{ARRAY} => $VAR1 = [
          'a',
          'r',
          'r',
          'a',
          'y'
        ];
*Bar::a{HASH} => $VAR1 = undef;
*Bar::a{IO} => $VAR1 = undef;
*Bar::a{CODE} => $VAR1 = undef;
*Bar::h{SCALAR} => $VAR1 = \undef;
*Bar::h{ARRAY} => $VAR1 = undef;
*Bar::h{HASH} => $VAR1 = {
          'h' => 'a',
          's' => 'h'
        };
*Bar::h{IO} => $VAR1 = undef;
*Bar::h{CODE} => $VAR1 = undef;

