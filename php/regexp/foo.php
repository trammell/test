<?php

$to = "foo, bar, baz  ,    quux   ";

$x = preg_split('/\s*,\s*/', $to);

var_export($x);



