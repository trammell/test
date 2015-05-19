# $Id: 02-keyvalue.t,v 1.4 2006/04/07 14:55:16 johnt Exp $

package main;

use strict;
use warnings;
use ParseIni;
use Test::More 'no_plan';

our @k;
our @v;

{
    package My::Ini::Parser;
    use base 'ELC::Ini::Parser';
    sub keyvalue {
        my ($parser, $k, $v, $section, $n) = @_;
        push @::k, $k;
        push @::v, $v;
    }
    sub section { }
    sub comment { }
    sub blank { }
}

# define the input .ini file

my $ini = <<'INI';
; this is a comment

[s1]
k0=v0
k1 =v1
k2= v2
k3 = v3
 k4 = v4
k5 = v5  ; this is a comment
"key 6" = "value 6"  ; another comment
  "key 7" = "  value 7  "  ; yet another comment
k8 = a value that wraps \
across a line
k9 = a value that wraps \
across \
two lines

INI

# construct the parser object

my $parser = My::Ini::Parser->new;

is ($parser->parse($ini), 1) or diag( $parser->error );

is( $k[0], 'k0' );
is( $v[0], 'v0' );

is( $k[1], 'k1' );
is( $v[1], 'v1' );

is( $k[2], 'k2' );
is( $v[2], 'v2' );

is( $k[3], 'k3' );
is( $v[3], 'v3' );

is( $k[4], 'k4' );
is( $v[4], 'v4' );

TODO: {
    local $TODO = 'comment handling needs to be added';
    is( $k[5], 'k5' );
    is( $v[5], 'v5' );

    #is_deeply( $k[6], [ 'key 6', 'value 6' ] );
    #is_deeply( $k[7], [ 'key 7', '  value 7  ' ] );
}
