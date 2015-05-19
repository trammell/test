#!perl -l

my $n = '   49 <- here';
$n =~ s/\G /0/g;
print "\$n: '$n'";

$n = ' _  49 <- here';
$n =~ s/\G /0/g;
print "\$n: '$n'"

