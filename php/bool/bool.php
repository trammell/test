<?php

pbool("0");
pbool("1");
pbool(0);
pbool(1);

function pbool($x) {
	echo "----------------\n";
	var_dump($x);
	if ($x) { echo " is True\n"; }
	else { echo " is False\n"; }
}


wacky(array('prop6' => '0'));
wacky(array('prop6' => ' 0'));

function wacky(array $rec) {
	$prop = "prop6";
	if (isset($rec[$prop])) {
		echo ">>> {$rec[$prop]} <<<";
		$rec[$prop] = $rec[$prop] ? "1" : "0";
		echo ">>> {$rec[$prop]} <<<\n";
	}
}

