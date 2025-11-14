#!/usr/bin/perl
# vim: set ai et ts tw=75 :

=pod

=head1 dollarwords.pl - print out the "value" of input words

This comes from a game in the book I<Because of Mr. Terupt> by Rob Buyea.
Each letter is assigned a numerical value (A=1, B=2, etc.) and so each word
has a value baseed on the values of its letters. In the book they are
looking for "dollar words"--words that have the value C<100>.

Using this script with C</usr/share/dict/words> and a little C<grep> magic
yields words of any desired value, e.g.:

    % perl dollarwords.pl /usr/share/dict/words | grep 100
    ...
    towards => 100
    ...
    %

=cut

use strict;
use warnings FATAL => 'all';

use List::Util 'sum';

while (<>) {
    chomp;
    my @ch = map { score($_) } split //;
    my @s = map { score($_) } split //;
    my $s = (sum map { score($_) } split //) || 0;
    print "$_ => $s\n" # if $s == 100;

}

# score a single letter
sub score {
    my $ord = ord(lc(shift()));
    return 0 if ($ord < 97) || ($ord > 122);
    return $ord - 96
}

__DATA__



