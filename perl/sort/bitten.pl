#!/usr/local/bin/perl
# $Id: bitten.pl,v 1.3 2008/01/11 16:43:11 johnt Exp $
# $Source: /usr/local/cvs/repo/user/johnt/test/sort/bitten.pl,v $

# see http://use.perl.org/~polettix/journal/35360 for commentary
# see also http://www.perlmonks.org/?node_id=575747

use strict;
use warnings FATAL => 'all';

my @stuff = sort returns_list('whatever');
print "stuff: [@stuff]\n";

@stuff = returns_list('again');
@stuff = sort @stuff;
print "stuff: [@stuff]\n";

sub returns_list {
    return qw( howdy all of you );
}

__END__

$ perl bitten.pl
stuff: [whatever]
stuff: [all howdy of you]

$ perl -MO=Deparse bitten.pl
use strict 'refs';
my(@stuff) = (sort returns_list 'whatever');
print "stuff: [@stuff]\n";
@stuff = returns_list('again');
@stuff = sort  @stuff;
print "stuff: [@stuff]\n";
sub returns_list {
    BEGIN {${^WARNING_BITS} = "\377\377\377\377\377\377\377\377\377\377\377\377"}
    use strict 'refs';
    return 'howdy', 'all', 'of', 'you';
}

