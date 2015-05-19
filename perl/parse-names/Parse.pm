# $Id: Parse.pm,v 1.1 2007/08/17 19:06:44 johnt Exp $

package Parse;

use strict;
use warnings;



sub run {
    my $class = shift;
    while (<>) {
        chomp;
        my @names = parse($_);
        my $novowel_re = qr/^bcdfghjklmnpqrstvwxz$/;
        print "@names\n";
        print "==> @names\n" if grep { /^[A-Z]+$/ } @names;
        print "==> @names @{[ scalar @names ]}\n" if @names < 2;
        print "==> @names\n" if grep { m/$novowel_re/ } @names;
    }
}

sub abbreviations {
    return qw(
      ABD
      AHRI
      BA
      BBA
      BS
      BSBA
      BSC
      CCP
      CHC
      CHRP
      CMC
      CPA
      CPC
      CPIM
      CPP
      Dr.
      GPHR
      HRM
      III
      JD
      Jr.
      MA
      MAIR
      MAOM
      MBA
      MHR
      MHRM
      MPA
      Mr.
      Mrs.
      Ms.
      MS
      MSHR
      MSIR
      MSOD
      ND
      PE
      Ph.D.
      PHR
      PHRA
      SCRP
      SPHR
      Sr.
    );
}

sub parse {
    my $name = shift;
    for ($name) { s/^\s+//; s/\s+$//; s/\s+/ /g; }

    my $abbrev = join q(|), map { quotemeta } __PACKAGE__->abbreviations();
    $name =~ s/\b(?:$abbrev)(\s+|$)/ /g;

    $name =~ s/\b[A-Z]*PHR(\s+|$)/ /g;

    $name =~ s/\b[A-Z]+[,.][A-Z]+(\b)//g;

    $name =~ s/\s[A-Z]\.?\s/ /ig;

    my @names = grep { /\S/ } split q( ), $name;

    return @names;
}

__PACKAGE__->run(@ARGV) unless caller();



1;

__END__

=pod

=head1 NAME

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut


