#!/usr/bin/perl -l

use strict;
use warnings FATAL => 'all';
use Text::Wrap;

my $message = qq{Please instruct each course participant to complete his or her
    enrollment using the following instructions.};

local $Text::Wrap::columns = 72;

$message =~ s/\s+/ /g;
$message =~ s/^\s+//;
$message =~ s/\s+$//;

for my $cols (40, 50, 60, 72) {
    local $Text::Wrap::columns = $cols;
    print "=" x 30;
    print Text::Wrap::wrap('', '', $message);
    print "=" x 30;
}

