#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';
use Date::Parse 'str2time';

my @strings = <<DATES;

1/1/1

DATES


for my $str (@strings) {

    my $time = str2time($str);

    print $time, "\n";

}



