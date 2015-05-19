<?php


$a = array(
	0.25,
	0.35,
	0.45,
	0.55,
	0.75,
);

foreach ($a as $x) {
	printf(">> %.18f\n", $x);
	$y = sprintf('%.1f', $x);
	$z = round($x, 1);
	$q = sprintf("%.1f", round($x, 1));
	echo "$x => $y    // sprintf\n";
	echo "$x => $z    // round()\n";
	echo "$x => $q    // sprintf(round())\n";
	var_dump($z);
	echo "\n";
}
