# $Id: 01-section.t,v 1.3 2005/10/26 19:07:22 johnt Exp $

package main;

use strict;
use warnings;
use ParseIni;
use Test::More 'no_plan';

our @s;

{
    package My::Ini::Parser;
    use base 'ELC::Ini::Parser';
    sub section {
        my ($parser, $section, $n) = @_;
        push @::s, $section;
    }
    sub keyvalue { }
    sub comment { }
    sub blank { }
}

# define the input .ini file

my $ini = <<'INI';
; this is a comment
[s0]
[s1]
1=1

[s2]
2=2

[s3]  ; trailing comments are OK
3=3

[s4]; so is this

[s 5]

[s-6]

[s7] ; this shouldn't screw it up [][][][]

4=4

INI

# construct the parser object

my $parser = My::Ini::Parser->new;

is($parser->parse($ini), 1) or diag( $parser->error );

is( $s[0], 's0'  );
is( $s[1], 's1'  );
is( $s[2], 's2'  );
is( $s[3], 's3'  );
is( $s[4], 's4'  );
is( $s[5], 's 5' );
is( $s[6], 's-6' );
is( $s[7], 's7'  );

