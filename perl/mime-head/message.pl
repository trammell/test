#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';
use MIME::Entity;

my $body = <<body;
Starting IFMA FMP build at Thu Sep  9 15:03:54 CDT 2010
IFMA FMP build finished at Thu Sep  9 15:06:28 CDT 2010
Got hc.contenttypes.ifma 0.1dev-r27411.
Got tgc.vocabularies 0.1.2dev-r1826.
body

my $msg = MIME::Entity->build(Data => $body);

$msg->head->add('title','build-20100915-093609');
$msg->head->add('description','cool and fruity');

print $msg->as_string;


__END__

    ### Part #1: a simple text document:
    $top->attach(Path=>"./testin/short.txt");

    ### Part #2: a GIF file:
    $top->attach(Path        => "./docs/mime-sm.gif",
                 Type        => "image/gif",
                 Encoding    => "base64");

    ### Part #3: some literal text:
    $top->attach(Data=>$message);

    ### Send it:
    open MAIL, "| /usr/lib/sendmail -t -oi -oem" or die "open: $!";
    $top->print(\*MAIL);
    close MAIL;
use MIME::Head;

my $head = MIME::Head->new;

$head->add('description','cool and fruity');

print $head->as_string;



__END__

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

sub summary_rfc822 {
    my $self = shift;
        my $msg = MIME::Lite->new(
                Type => 'text/plain',
                        Data => $self->summary_text,
                            );
                                $msg->add('title', $self->title);
                                    $msg->add('description', 'fleedle');
                                        return $msg->as_string;
                                        }


MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailer: MIME::Lite 3.027 (F2.74; T1.30; A2.06; B3.07; Q3.07)
Date: Wed, 15 Sep 2010 09:36:09 -0500
Title: build-20100915-093609
Description: fleedle

Starting IFMA FMP build at Thu Sep  9 15:03:54 CDT 2010
IFMA FMP build finished at Thu Sep  9 15:06:28 CDT 2010
Got hc.contenttypes.ifma 0.1dev-r27411.
Got tgc.vocabularies 0.1.2dev-r1826.
Posting DAV content to http://dev.holmescorplsp.com/Members/johnt/builds/test

