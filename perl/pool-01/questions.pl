#!perl -l
# $Id: questions.pl,v 1.1 2005/08/05 18:12:15 johnt Exp $

use strict;
use warnings;
use Data::Dumper;
use TBL::Exam::question_pool;
use TBL::Exam::question;

my $self = { exam_id => 6 };  # APICS pretest

my $exam = TBL::Exam::exam->retrieve( $self->{exam_id} );
print Dumper($exam);

my $product_id = $exam->product_id;
print Dumper($product_id);

my @questions = TBL::Exam::question->search(product_id => $product_id);
print "Question count: @{[ scalar @questions ]}";
#print Dumper(\@questions);

