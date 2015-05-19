#!/usr/bin/env python2.6


import boto.ec2
ec2 = boto.ec2.connect_to_region('us-west-2')

print ec2


