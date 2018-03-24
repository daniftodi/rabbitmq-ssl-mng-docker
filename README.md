# RabbitMQ with SSL Configuration and Management in Docker

> RabbitMQ and SSL made easy for tests.


This repository aims at building a RabbitMQ container with SSL enabled.  
Generation of the server certificates, as well as server configuration, are performed during
the image's build. A client certificate is generated when a container is created from this image.

It is recommended to mount a volume so that the client certificate can be reached from the
host system. Client certificates are generated under the **/home/client** directory.


## To build this image

```
cd tests && ./build.sh
```

The generated image doesn't contains SSL certificates for the server side, use Dockerfile.AutoSSL instead.

```
docker build - -t rabbitmq-with-ssl:latest < Docker.AutoSSL
```

## To run this image

```
mkdir -p /tmp/docker-test \
	&& rm -rf /tmp/docker-test/* \
	&& docker run -d --rm -p 5671:5671 -p 8080:15671 -v /tmp/docker-test:/home/client rabbitmq-with-ssl:latest
```

Here, we bind the port 5671 from the container on the 5671 port on the local host and port for the management interface 15671 to 8080 port on the local host.  
We also share a local directory with the container, to retrieve the client certificate.
You can verify client certificates were generated with `ls /tmp/docker-test`. This directory contains
a key store and a trust store, both in the PKCS12 format.
Management interface is available at https://localhost:8080


## To stop the container

`docker stop <container-id>` will stop the container.  
If you kept the `--rm` option, it will be deleted directly.


## To run quick tests

```
cd tests && ./test.sh
```
