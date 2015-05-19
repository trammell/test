<?php

$ps = new \SimpleXMLElement('<PartnerSubscriber/>');
$ps->addAttribute('xmlns', 'http://temp.org/PartnerSubscriber');

$ps->addChild('firstname', 'Harry');
$ps->addChild('lastname', 'Potter');

echo $ps->asXML();
