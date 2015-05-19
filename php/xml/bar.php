<?php
$x = new SimpleXMLElement('<root name="toplevel"></root>');
$f1 = new SimpleXMLElement('<child pos="1">alpha</child>');
$f2 = new SimpleXMLElement('<child pos="2">beta</child>');
$f3 = new SimpleXMLElement('<child pos="3">gamma</child>');

$x->{$f1->getName()} = $f1;
$x->{$f2->getName()}[] = $f2;
$x->{$f3->getName()}[] = $f3;

echo 'count child=',$x->count(),"\n";
echo $x->asXML();

foreach ( $x->children() as $foo ) {
	var_dump($foo);
}







