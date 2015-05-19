#!perl -l

$ENV{PATH} ||= 'aaa:bbb:ccc:ccc:ddd:eee:aaa';

print join ':', map { $seen{$_}++ ? () : ($_) } split /:/, lc $ENV{PATH};

