<?php

$a = array(
	0.5,
	1.5,
	"1.5",
	2.5,
	"2.5",
	"3.4999999999",
	3.5,
	"3.5000000001",
);

foreach ($a as $x) {
	$y = canon($x, 1);
	echo "$x => $y\n";
}




function canon($x) {
	#$x = (float)$x;
	$x = ($x <  0.0) ?  0.0 : $x;
	$x = ($x > 10.0) ? 10.0 : $x;
	return round($x, 1);
}


