#!perl -l

$_ = '382 cats eat 99.223 mice every 15 minutes and 10 seconds.';

while (/(\d+)/g) {
    print "Found: $1";
}

