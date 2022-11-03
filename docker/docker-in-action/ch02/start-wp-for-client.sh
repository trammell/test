#!/bin/bash

if [ ! -n "$CLIENT_ID" ]
then
	echo Client ID not set
	exit 1
fi

WP_CID=$(docker create --link $DB_CID:mysql --name wp_$CLIENT_ID -p 80 \
	--read-only -v /run/apache2/ --tmpfs /tmp \
	-e WORDPRESS_DB_NAME=$CLIENT_ID \
	wordpress:5.0.0-php7.2-apache)
docker start $WP_CID

AGENT_CID=$(docker create --name agent_$CLIENT_ID \
	--link $WP_CID:insideweb \
	--link $MAILER_CIDD:insidemailer \
	dockerinaction/ch2_agent)
docker start $AGENT_CID

