# $Id: ParseIni.pm,v 1.8 2006/04/07 14:55:14 johnt Exp $

package ELC::Ini::Parser;

use strict;
use warnings;
use Text::Balanced 'extract_delimited';
use Carp 'croak';

sub new {
    my ($class, %args) = @_;
    my %defaults = ( default_section => '' );
    my $self = { %defaults, %args };
    return bless $self, $class;
}

sub parse { 
    my ($self, $in) = @_;
    if (ref($in)) {
        return $self->__parsefile($in);
    }
    else {
        open(my $fh, '<', \$in) or do {
            $self->{error} = "Can't open input string as file: $!";
            return undef;        
        };
        return $self->__parsefile($fh);
    }
}

sub error {
    return $_[0]->{error};
}

sub __parsefile {
    my ($self, $fh) = @_;
    my $section = $self->{default_section};
    while (<$fh>) {
        chomp(my $text = $_);
        if (!/\S/) {
            $self->blank($section, $.);
        }
        elsif (/^;(.*)/) {   # comment
            $self->comment($1,$section,$.);
        }
        elsif (/^\[(.*?)\]/) {   # section
            $section = $1;
            $self->section($section,$.);
        }
        elsif (/^\s*[^=]+?\s*=/) { # key/value line
            my $key = extract_delimited;
            my $value = extract_delimited;
            $self->keyvalue($key,$value,$section,$.);
        }
        else  {
            $self->{error} = "Syntax error, file $fh, line $.: '$text'";
            return undef;
        }
    }
    return 1;
}

sub comment {
    my ($parser, $comment, $lineno, $section) = @_;
    print "Comment is '$comment', section '$section', line number $lineno\n";
}

sub section {
    my ($parser, $section, $lineno) = @_;
    print "Section is [$section], line number $lineno\n";
}

sub keyvalue {
    my ($parser, $key, $value, $section, $lineno) = @_;
    print "Data '$key' = '$value', section [$section], line number $lineno\n";
}

sub blank {
    my ($parser, $section, $lineno) = @_;
    print "Blank line, section [$section], line number $lineno\n";
}

1;

