#!perl -l

$_ = '3,4,5,9,120';

while (/\G,?(\d+)/g) {
    print "Found: $1";
}

