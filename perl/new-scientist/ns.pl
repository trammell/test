#!/usr/local/bin/perl

use strict;
use warnings FATAL => 'all';

for my $mod7 (100 .. 999) {
    next unless good7($mod7);

    for my $mod9 (100 .. 999) {
        next unless good9($mod9);
        next if $mod9 =~ /[$mod7]/;

        for my $mod11 (100 .. 999) {
            next unless good11($mod11);
            next if $mod11 =~ /[$mod7$mod9]/;
            print "$mod7 $mod9 $mod11\n";
        }

    }
}

sub good {
    my ($mod,$i) = @_;
    $i = sprintf '%03d', $i;
    return if $i =~ /\D/;
    return if $i =~ /0/;
    return if $i =~ /(\d).*\1/;
    return unless $i % $mod == 0;
    my $r = reverse $i;
    return unless $r % $mod == 0;
    return 1;
}

sub good7  { return good(7,$_[0]) }
sub good9  { return good(9,$_[0]) }
sub good11 { return good(11,$_[0]) }

__END__

http://use.perl.org/~Ovid/journal/36624

Every week, New Scientist has an "Enigma" puzzle. I've always thought they
should be easy to solve with programming, so this week I decided to try it.
Here's this week's puzzle:

    Using each of the digits 1 to 9, find a 3-digit positive integer divisible
    by 7 whose reverse is an integer also divisible by 7, a 3-digit positive
    integer divisible by 9 whose reverse is an integer also divisible by 9,
    and a 3-digit positive integer divisible by 11 whose reverse is an integer
    also divisible by 11.

What are the smallest and largest of your six integers?

So basically you want all three digit numbers not containing zero.  When you
are examining candidates, the numbers should use "each" of the digits, not
just "any". My program is still getting too many results. Either I&apos;m
missing something fundamental or their is an ambiguity in the spec.

My solution:

168 234 759
168 234 957
168 243 759
168 243 957
168 324 759
168 324 957
168 342 759
168 342 957
168 423 759
168 423 957
168 432 759
168 432 957
861 234 759
861 234 957
861 243 759
861 243 957
861 324 759
861 324 957
861 342 759
861 342 957
861 423 759
861 423 957
861 432 759
861 432 957

The "six" integers are:

    equal to 0 mod 7:  168 861
    equal to 0 mod 9:  234 243 324 342 423 432
    equal to 0 mod 11: 759 957

