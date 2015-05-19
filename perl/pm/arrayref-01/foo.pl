#!perl -l
use strict;
use warnings;

my $a1 = get_arrayref(1,2,3);
print '@$a1 is true!' if @$a1;
print for @$a1;

my $a2 = get_arrayref();

eval { @$a2; };
warn "Eval output 1: '$@'\n" if $@;

eval { print '@$a2 is true!' if @$a2; };
warn "Eval output 2: '$@'\n" if $@;

eval { print for @$a2; };
warn "Eval output 3: '$@'\n" if $@;


my $a3 = undef;
for (@$a3) {
    print "a3!";
}



sub get_arrayref {
    return (@_) ? [@_] : undef;
}

