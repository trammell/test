#!perl -l

sub gen_fib {
    my $low = my $high = 0;
    return sub {
        if ($high == 0) {
            $high = 1;
            return 0;
        }
        ($low, $high) = ($high, $high+$low); 
        return $low;
    }
}

my $fib = gen_fib;
print $fib->() for 1..20;

__END__

http://www.research.att.com/cgi-bin/access.cgi/as/njas/sequences/eisA.cgi?Anum=A000045

Here is Sequence A000045 (this will take a moment): 

ID Number: A000045 (Formerly M0692 and N0256)
URL:       http://www.research.att.com/projects/OEIS?Anum=A000045
Sequence:  0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,
           4181,6765,10946,17711,28657,46368,75025,121393,196418,
           317811,514229,832040,1346269,2178309,3524578,5702887,
           9227465,14930352,24157817,39088169
Name:      Fibonacci numbers: F(n) = F(n-1) + F(n-2), F(0) = 0, F(1) = 1, F(2) = 1, ...

