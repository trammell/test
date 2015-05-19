#!/usr/local/bin/perl

use strict;
use warnings FATAL => 'all';
use HTML::Parser;
use Data::Dumper;

my %inside;
my $special = "CSCP";
my $out = q();
my @ignore = qw/ script style /;

my $start = sub {
    my ($tag,$text) = @_;
    $out .= $text;
    ++$inside{$tag};
};

my $end = sub {
    my ($tag,$text) = @_;
    $out .= $text;
    --$inside{$tag};
};

my $hilite = sub {
    my ($text) = @_;
    if (grep $inside{$_}, @ignore) {
        $out .= $text;
    }
    else {
        $text =~ s{($special)}{<span style="highlight">$1</span>};
        $out .= $text;
    }
};

my $p = HTML::Parser->new(
    start_h   => [ $start,  "tagname,text" ],
    end_h     => [ $end,    "tagname,text" ],
    text_h    => [ $hilite, "text" ],
    default_h => [ sub { $out .= $_[0] }, 'text' ],
);

$p->parse_file('expired.html');

print $out;

