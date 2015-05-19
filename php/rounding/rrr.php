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
	$y = sprintf('%.0f', $x);
	echo "$x => $y\n";
}

echo "===========================\n";

$a = array(
	0.125,
	0.25,
	0.35,
	0.45,
	0.55,
	0.75,
	0.875,
);

foreach ($a as $x) {
	printf(">> %.18f\n", $x);
	$y = sprintf('%.1f', $x);
	$z = round($x, 1);
	echo "$x => $y    // sprintf\n";
	echo "$x => $z    // round()\n";
}
