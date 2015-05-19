#!/usr/bin/env perl

use strict;
use warnings FATAL => 'all';

for my $i (1 .. 3) {
    print << "EOT";
    def px${i} = new E(user)
    if (!px${i}.hasErrors()) {
        println "\${px${i}.name} / \${px${i}.empr.to} OK"
    }
EOT
}

