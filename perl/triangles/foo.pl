#!perl -l
# $Id: foo.pl,v 1.2 2005/10/28 22:32:08 johnt Exp $

use strict;
use warnings;

my @lines = map { y/A-Z//cd; $_ } split /\n/, <<__LINES__;
A B
A C F I
A D G J
A E
B C D E
B F H J
B I
E G H I
E J
I J
__LINES__

my @p = ('A' .. 'J');

sub skip {
    return unless @_;
    my $re = join '|', map { join '.*', @_[@$_] } [0,1], [0,2], [1,2];
    return (3 == grep /$re/, @lines) ? 0 : 1;
}

my $iter = do {
    my @curr;
    sub {
        if (@curr) {
            my $i = @curr;
            while ( --$i > -1 ) {
                return () if join('', @p[@curr]) eq $p[-1] x 3;
                $curr[ $i ]++;
                $curr[ $i ] = 0, next unless $curr[ $i ] <= $#p;
                last;
            }
        }
        else {
            @curr = (0) x 3;
        }
        return @p[@curr];
    }
};

# print @_ while (@_ = $iter->());

my $triangles = do {
    sub {
        my @x;
        1 while skip( @x = $iter->() );
        @x;
    }
};

print @_ while @_ = $triangles->();

