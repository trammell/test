# $Id: 00-use.t,v 1.6 2006/04/07 14:55:16 johnt Exp $

use strict;
use warnings;
use Test::More 'no_plan';

BEGIN { use_ok('ParseIni'); }

{
    package My::Ini::Parser;
    use base 'ELC::Ini::Parser';

    our $blanks;
    our @sections;
    our @keyvalues;
    our @comments;

    sub blank {
        $blanks++;
    }
    sub section {
        my ($parser, $section, $n) = @_;
        push @sections, $section, $n;
    }
    sub keyvalue {
        my ($parser, $key, $value, $section, $n) = @_;
        push @keyvalues, $key, $value, $section, $n;
    }
    sub comment {
        my ($parser, $comment, $n, $section) = @_;
        push @comments, $comment, $n, $section;
    }
}

my $parser = My::Ini::Parser->new;

isa_ok($parser, 'ELC::Ini::Parser');
can_ok($parser, 'parse');

my $status = $parser->parse(<<'INI');
; this is a comment
[section]
key1=123
key2=456
INI

is ($status, 1) or diag( $parser->error );

is_deeply(
    \@My::Ini::Parser::comments,
    [ ' this is a comment', '', 1 ],
    'comments parsed correctly'
) or diag( @My::Ini::Parser::comments );

is_deeply(
    \@My::Ini::Parser::keyvalues,
    [ 'key1', 123, 'section', 3, 'key2', '456', 'section', 4 ],
    'key/value lines parsed correctly'
) or diag( @My::Ini::Parser::keyvalues );

is_deeply(
    \@My::Ini::Parser::sections,
    [ 'section', 2 ],
    'section line parsed correctly'
) or diag( @My::Ini::Parser::sections );

