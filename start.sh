#!/bin/bash

docker run -d -v rabbitmq-mng:/var/lib/rabbitmq --hostname rabbitmq-ssl --name rabbitmq-ssl -v /root/rabbitmq-ssl-mng-docker/ssl-certs:/ssl-certs -p 15671:15671 -p 5671:5671 -p 61614:61614 rabbitmq-ssl:latest
