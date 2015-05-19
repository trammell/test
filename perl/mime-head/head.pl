#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use MIME::Head;

my $head = MIME::Head->new;

$head->add('description','cool and fruity');

print $head->as_string;



    #        $head->replace('content-type', 'text/plain; charset=US-ASCII');
    #            $head->replace('content-length', $len);
    #
    #                ### Parse a new header from a filehandle:
    #                    $head = MIME::Head->read(\*STDIN);
    #
    #                        ### Parse a new header from a file, or a readable
    #                        pipe:
    #                            $testhead =
    #                            MIME::Head->from_file("/tmp/test.hdr");
    #                                $a_b_head = MIME::Head->from_file("cat
    #                                a.hdr b.hdr |");
    #
    #                                Output
    #
    #                                    ### Output to filehandle:
    #                                        $head->print(\*STDOUT);
    #
    #                                            ### Output as string:
    #                                                print STDOUT
    #                                                $head->as_string;
    #                                                    print STDOUT
    #                                                    $head->stringify;
