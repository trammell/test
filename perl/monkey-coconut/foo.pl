#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use feature 'say';


my $c = coconuts();

say "first pile: $c";

$c = 0.8 * ($c - 1);
say "second pile: $c";

$c = 0.8 * ($c - 1);
say "third pile: $c";

$c = 0.8 * ($c - 1);
say "fourth pile: $c";

$c = 0.8 * ($c - 1);
say "fifth pile: $c";

$c = 0.8 * ($c - 1);
say "final pile: $c";

$c = 0.2 * ($c - 1);
say "1/5 of final pile: $c";

# $n is originally the last share of coconuts each sailor gets
sub coconuts {
    for my $n (0 .. 10_000) {

        # inflate $n to the size of the final pile
        $n = 5 * $n + 1;
        my @n = ($n);

        # inflate $n to the size of the 5th pile
        $n = 1.25 * $n + 1;
        next unless is_int($n);
        push @n, $n;

        # inflate $n to the size of the 4th pile
        $n = 1.25 * $n + 1;
        next unless is_int($n);
        push @n, $n;

        # inflate $n to the size of the 3rd pile
        $n = 1.25 * $n + 1;
        next unless is_int($n);
        push @n, $n;

        # inflate $n to the size of the 2nd pile
        $n = 1.25 * $n + 1;
        next unless is_int($n);
        push @n, $n;
        say "piles: @n";

        # inflate $n to the size of the 1st pile
        $n = 1.25 * $n + 1;
        next unless is_int($n);
        push @n, $n;

        say "piles: @n";
        return $n[-1];
    }
    return undef;
}

sub is_int {
    my $x = shift;
    my $epsilon = 1e-9;
    return abs($x - int($x)) < $epsilon;
}

__END__

See:
    http://code.activestate.com/recipes/577335-martin-gardners-the-monkey-and-the-coconuts-proble/
    http://mathworld.wolfram.com/MonkeyandCoconutProblem.html

Five sailors arrive at a deserted island that has only coconuts and one
monkey. The sailors collect all the coconuts into one big pile and agree to
divide up the coconuts into equal shares the next morning. However during the
night each sailor wakes up one at a time afraid to trust the others and
decides to take his share secretly. So each sailor takes 1/5 of the coconuts
and hides it. Each time there is one coconut left over and the sailor gives
that to the monkey. In the morning they divide what is left of the pile into
equal shares and there is still one coconut left for the monkey.

How many coconuts were in the original pile?

    first pile
        sailor 1 gives 1 to monkey, takes 1/5

    second pile
        sailor 2 gives 1 to monkey, takes 1/5

    third pile
        sailor 3 gives 1 to monkey, takes 1/5

    fourth pile
        sailor 4 gives 1 to monkey, takes 1/5

    fifth pile
        sailor 5 gives 1 to monkey, takes 1/5

    final pile
        1 goes to monkey, all sailors take 1/5
