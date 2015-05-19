#!perl -l

# The general format of a linear congruential pseudorandom number generator is:
#     N[i+1] = ( N[i] * A + C ) mod M

use strict;
use warnings;
use diagnostics;

use subs 'ran16';

print "2^8: ",  2**8; 
print "2^12: ", 2**12; 
print "2^16: ", 2**16; 

my @params = (
    [ 171, 0, 30269 ],    # $a, $c, $m

);

for (@params) {
    my $prng = create_lcprng(@$_);
    print "period for prime (@$_) is ", getperiod($prng);
}

sub getperiod {
    my $algo = shift;
    my %seen;
    my $count = 0;
    while (++$count) {
        last if $seen{ &$algo }++;
    }
    return $count;
}

sub create_lcprng {
    my ($a, $c, $m, $seed) = @_;
    return sub {
        $seed ||= 1;
        $seed = ( $seed * $a + $c ) % $m;
    };
}

{
    my @primes = qw/ 2 3 5 7 11 13 17 19 23 /;
    sub get_next_prime {
        

    }
    sub get_primes_up_to {
        

    }
    sub is_prime {
        my $n = shift;
        foreach my $i (0 .. $#primes) {
            return 0 if $n % $primes[$i] == 0;
            last if $primes[$i] * $primes[$i] 
        }
    }

    return sub {
        ($two=1,return 2) unless $two;
        ($three=1,return $p=3) unless $three;


    };
}




