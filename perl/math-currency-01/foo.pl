#!/usr/local/bin/perl -l

use strict;
use warnings;
use lib '/usr/home/johnt/local/lib/perl5/lib/';
use Math::Currency;
use Math::Round 'nearest';

my $mc = Math::Currency->new('$100');
print $mc;
print "$mc";

my $mc2 = abs($mc - '$10');
print $mc2;
print "$mc2";

my $mc3 = abs('$10' - $mc);
print $mc3;
print "$mc3";

my $mc4 = abs(10 - $mc);
print $mc4;
print "$mc4";

my $rounded = Math::Currency->new( nearest(10, Math::Currency->new('$53')) );
print "\$rounded = $rounded";
print ref($rounded);

__END__

Sample output with newer versions of Math::Currency

$100.00
$100.00
$NaN.00
$NaN.00
$NaN.00
$NaN.00
$90.00
$90.00

