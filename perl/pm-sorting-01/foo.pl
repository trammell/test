#!perl -l
use strict;
use warnings;

my @a = qw/ A C D F I N P R S X /;
my @status = map $a[ rand @a ], 1 .. 20;

for (@status) {
    s/P|F|C|D|I/Posted/;
    s/A/Accepted/;
    s/N/New/;
    s/R/Rejected/;
    s/S/Save/;
    s/X/Canceled/;
}

my @strings = sort @status;
print for @strings;

__END__

Accepted
Canceled
Canceled
Canceled
New
New
New
New
Posted
Posted
Posted
Posted
Posted
Posted
Posted
Posted
Posted
Rejected
Rejected
Save

