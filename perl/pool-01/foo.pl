#!perl
# $Id: foo.pl,v 1.3 2005/08/03 21:39:29 johnt Exp $

use strict;
use warnings;
use TBL::Exam::question_pool;

test();

sub test {
    warn "testing\n";

    my $pool = TBL::Exam::question_pool->find_or_create({
        association_id => 'atest', product_id => 'ptest', 
        user_id => 'utest' });

    $pool || die "unable to create pool";
    warn "created pool\n";

    my @pmem = $pool->members;
    my $count = @pmem;
    warn "found $count pool members\n";

    foreach my $n ( 11 .. 19 ) {
        next if grep $_->question_id == $n, @pmem;
        $pool->add_to_members({ question_id => $n, usage_count => undef });
    }

    my $iter = $pool->members;
    while (my $m = $iter->next) {
        my $uc = $m->usage_count;
        $uc = "NULL" unless defined $uc;
        warn $m->question_id, " => $uc ", $m->question_id->answer_type,   "\n";

    }

}

