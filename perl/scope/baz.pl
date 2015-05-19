#!/usr/local/bin/perl -l
# $Id: baz.pl,v 1.1 2007/05/18 19:54:09 johnt Exp $

use strict;
use warnings;
use Data::Dumper ();

use PadWalker ':all';

{
    package Blue;
    use PadWalker ':all';
    print '-' x 30;
    my $x = 1;
    our $y = 2;
    use vars '$z';
    $z = 3;
    print Data::Dumper->Dump([peek_my(0), peek_our(0)],[qw( *my *our )]);
}

{
    package Red;
    use PadWalker ':all';
    print '-' x 30;
    my $x = 1;
    our $x = 2;
    print Data::Dumper->Dump([peek_my(0), peek_our(0)],[qw( *my *our )]);
}

{
    package Green;
    use PadWalker ':all';
    print '-' x 30;
    our $x = 2;
    my $x = 1;
    print Data::Dumper->Dump([peek_my(0), peek_our(0)],[qw( *my *our )]);
}




