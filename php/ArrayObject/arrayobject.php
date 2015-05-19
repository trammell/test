<?php

$a = new \ArrayObject();
$a["test"] = 1;
var_dump( array_key_exists( "test", $a ) );
var_dump( array_key_exists( "test1", $a ) );


$b = new \ArrayObject();

if (array_key_exists("test", $b)) {

}


