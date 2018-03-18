#!/bin/bash

docker run -d -v rabbitmq-mng:/var/lib/rabbitmq --hostname rabbitmq-mng --name mng-rabbit -v /etc/letsencrypt/live/events.berlizzo.md:/certs -p 8081:15672 -p 5672:5672 -p 8082:15674 -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password -e RABBITMQ_SSL_CERT_FILE=/ssl-certs/cert1.pem -e RABBITMQ_SSL_KEY_FILE=/ssl-certs/privkey1.pem -e RABBITMQ_SSL_CA_FILE=/ssl-certs/chain1.pem rabitmq-mng-stomp-ssl
