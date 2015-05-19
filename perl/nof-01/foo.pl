#!perl -l

use strict;
use warnings;
use Data::Dumper;

require 'getdbh.pl';

my $dbh = get_dbh();

$dbh->do('USE test');
$dbh->do('CREATE TEMPORARY TABLE t1 (name char(8))');

for (qw/ Jim Judy Steve Jack Jodie Sally Alice /) {
    $dbh->do('INSERT INTO t1 VALUES (?)', undef, $_);
}

for (qw/ J S A X /) {
    my $sth = $dbh->prepare("SELECT name FROM t1 where name like '$_%'");
    my $x = $sth->execute();
    print "$_: \$x = $x";
}

__END__

J: $x = 4
S: $x = 2
A: $x = 1
X: $x = 0E0

