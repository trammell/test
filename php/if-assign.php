<?php

function foo() { return 10; }
function bar() { return 0; }

if ($x = foo()) {
    print "foo is true ($x)\n";
}

if ($y = bar()) {
    print "bar is false\n";
}

print "x = $x, y = $y\n";
