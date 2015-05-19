# $Id: 03-comment.t,v 1.1 2006/04/07 14:55:16 johnt Exp $

package main;

use strict;
use warnings;
use ParseIni;
use Test::More 'no_plan';

our @c;

{
    package My::Ini::Parser;
    use base 'ELC::Ini::Parser';
    sub keyvalue { }
    sub section { }
    sub comment { push @::c, $_[1]; }
    sub blank { }
}

# define the input .ini file

my $ini = <<'INI';
; comment 0
    ; comment 1

[s1]  ; comment 2
k0=v0   ; comment 3
k1 =v1  ; comment 4
k2= v2  ; comment 5 is a very long comment
k3 = v3
 k4 = v4
k5 = v5  ; this is comment 6
"key 6" = "value 6"  ; another comment, number 7
  "key 7" = "  value 7  "  ; yet another comment

INI

# construct the parser object

my $parser = My::Ini::Parser->new;

is ($parser->parse($ini), 1) or diag( $parser->error );

is_deeply( $c[0], 'comment 0' );
is_deeply( $c[1], 'comment 1' );
is_deeply( $c[2], 'comment 2' );
is_deeply( $c[3], 'comment 3' );
is_deeply( $c[4], 'comment 4' );

TODO: {
    local $TODO = 'comment handling needs to be added';
    is_deeply( $c[5], 'comment 5 is a very long comment' );
    is_deeply( $c[6], 'this is comment 6' );
    is_deeply( $c[7], 'another comment, number 7' );
}
