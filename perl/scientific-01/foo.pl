#!perl -l
use strict;
use warnings;
$, = ' ';

my @n = qw/ 1e-13 2e-14 3e-15 4e-16/;
print sort @n;
print sort { $a <=> $b } @n;

@n = (1e-13, 2e-14, 3e-15, 4e-16);
print sort @n;
print sort { $a <=> $b } @n;

__END__

1e-13 2e-14 3e-15 4e-16
4e-16 3e-15 2e-14 1e-13
1e-13 2e-14 3e-15 4e-16
4e-16 3e-15 2e-14 1e-13

