<?php

$vals = array('a','b','c','d','e','f');
$it = new NoRewindIterator(new ArrayIterator($vals));

echo "---- round 1 ----\n";

foreach ($it as $x) {
	print "$x\n";
	if ($x == 'd') { break; }
}

echo "---- round 2 ----\n";

foreach ($it as $x) {
	print "$x\n";
}






