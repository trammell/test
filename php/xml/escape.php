<?php

// Create SimpleXMLElement
$foo = new SimpleXMLElement('<foo/>');

// Add an element using addChild() with text
#$foo->addChild('bar', 'this&that');

// Add an element using a property
$foo->lol = 'this&that';

// Add a child using addChild() then set text as a property
$foo->addChild('what');
$foo->what = 'this&that';

// Add a child using a property with invalid UTF-8
#$foo->magic = "\x80";

// Serialize it
echo $foo->asXML();








