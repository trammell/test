#!perl

use strict;
use warnings;
use diagnostics;

for ('aaa' .. 'eee') {
    y/abcde/acgmt/;
    print;
}

