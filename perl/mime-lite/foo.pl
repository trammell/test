#!/usr/local/bin/perl
# $Id: foo.pl,v 1.1 2007/08/17 19:06:43 johnt Exp $

use strict;
use warnings;
use MIME::Lite;

MIME::Lite->send("sendmail","/usr/sbin/sendmail -t");

my $msg = MIME::Lite->new(
    From    => 'customerservice@holmescorp.com',
    To      => 'john-trammell@gmail.com',
    Subject => 'ePayroll course: late enrollment',
    Type    => 'TEXT',
    Data    => 'email body',
);

print $msg->as_string;

#late_enrollment_email->send;

### Format as a string:
#          $str = $msg->as_string;

