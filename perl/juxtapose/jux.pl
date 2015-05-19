#!/usr/local/bin/perl -l
# $Id: jux.pl,v 1.2 2007/08/17 14:02:32 johnt Exp $

use strict;
use warnings;
use diagnostics;

my $dict = dict();

my $r = sub { $dict->[ rand @$dict] };

for (1 .. ($ARGV[0] || 10)) {
    my $count = 1 + int(rand(4));
    print join q(-), map $r->(), 1 .. $count;
}

sub dict {
    open(my $fh, '/usr/share/dict/words') or die $!;
    return [
        grep { length($_) > 3 }
        grep { length($_) < 7 }
        grep { /^[a-z]+$/ }
        map { chomp; $_ }
        <$fh>
    ];
}

