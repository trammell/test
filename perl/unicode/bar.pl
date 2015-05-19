#!/usr/local/bin/perl -l
# $Id: bar.pl,v 1.2 2006/08/11 18:06:17 johnt Exp $

use strict;
use warnings;
use utf8;
require 'nice.pl';
binmode(STDOUT, ':utf8');

# see perluniintro, "Questions With Answers"
#{
#    my $x = "\xff";
#    my $y = "\x{100}";
#    print '$x is utf8' if utf8::is_utf8($x);
#    print '$y is utf8' if utf8::is_utf8($y);
#}

{
    my $a = "\xe9";
    print "\$a=$a";
    print nice_string($a);
}

{
    my $b = pack('U', 0xe9);
    print "\$b=$b";
    print nice_string($b);
}

# 0x42 == 'B'
my $chars = pack("U0C*", 0x80, 0x42); 
print nice_string($chars);

