#!/usr/bin/perl -wT

use strict;
use warnings FATAL => 'all';
use Test::More tests => 20;

ok(&parse_decimal("1,234,567") == 1234567);
ok(&parse_decimal("1,234567") == 1.234567);
ok(&parse_decimal("1.234.567") == 1234567);
ok(&parse_decimal("1.234567") == 1.234567);
ok(&parse_decimal("12,345") == 12345);
ok(&parse_decimal("12,345,678") == 12345678);
ok(&parse_decimal("12,345.67") == 12345.67);
ok(&parse_decimal("12,34567") == 12.34567);
ok(&parse_decimal("12.34") == 12.34);
ok(&parse_decimal("12.345") == 12345);
ok(&parse_decimal("12.345,67") == 12345.67);
ok(&parse_decimal("12.345.678") == 12345678);
ok(&parse_decimal("12.34567") == 12.34567);
ok(&parse_decimal("123,4567") == 123.4567);
ok(&parse_decimal("123.4567") == 123.4567);
ok(&parse_decimal("1234,567") == 1234.567);
ok(&parse_decimal("1234.567") == 1234.567);
ok(&parse_decimal("12345") == 12345);
ok(&parse_decimal("12345,67") == 12345.67);
ok(&parse_decimal("1234567") == 1234567);

sub parse_decimal {
    (my $input = shift) =~ s/[^\d,\.]//g;
    my ($pc, $cp) = ([q(.),q(,)],[q(,),q(.)]);
    my @dispatch = (
        [ '\d,\d+\.\d'  => $pc, ],
        [ '\d\.\d+,\d'  => $cp, ],
        [ '\d\.\d+\.\d' => $cp, ],
        [ '\d,\d+,\d'   => $pc, ],
        [ '\d{4},\d'    => $cp, ],
        [ '\d{4}\.\d'   => $pc, ],
        [ '\d,\d{3}$'   => $pc, ],
        [ '\d\.\d{3}$'  => $cp, ],
        [ '\d,\d'       => $cp, ],
        [ '\d.\d'       => $pc, ],
    );
    my @args = @$pc;    # default
    for my $d (@dispatch) {
        next unless $input =~ /$d->[0]/;
        @args = @{ $d->[1] };
        last;
    }
    return parse_with_separators($input, @args);
}

sub parse_with_separators {
    my $input = shift;
    my $decimal_separator = shift;
    my $thousand_separator = shift;
    my $output = $input;
    $output =~ s/\Q${thousand_separator}\E//g;
    $output =~ s/\Q${decimal_separator}\E/./g;
    return $output;
}



