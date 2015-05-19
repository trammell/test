<?php


$ps = new \SimpleXMLElement('<PartnerSubscriber/>');
$ps->addAttribute('xmlns', 'http://temp.org/PartnerSubscriber');
$ps->addChild('firstname', 'Harry');
$ps->addChild('lastname', 'Potter');
echo $ps->asXML() . "\n";
echo $ps->getName() . "\n";
echo (string)$ps . "\n";

echo "\n===================\n";


$pbs = new \SimpleXMLElement('<PartnerBulkSubscribers/>');
$pbs->addAttribute('xmlns', 'http://temp.org/PartnerBulkSubscribers');
$pbs->addChild('hostId', '123');
$pbs->addChild('databaseId', '99999');
$pbs->addChild('authorizationKey', 'kwijybo');

$elt = $pbs->addChild('Subscribers');

appendXMLElement($elt, $ps);
appendXMLElement($elt, $ps);

function appendXMLElement($parent, $child) {

	# $xml = $parent->addChild($child->getName(), (string)$child);

	$name = $child->getName();

	$xml = $parent->addChild($name);

	($parent->$name)[0] = (string)$child;

	foreach ($child->children() as $c) {
		appendXMLElement($xml, $c);
	}
	foreach ($child->attributes() as $k => $v) {
		$xml->addAttribute($k, $v);
	}
}

echo $pbs->asXML();

