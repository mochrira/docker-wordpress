# Wordpress

Wordpress development environment for Wajek Studio. This Image based on mochrira/php:8-apache.

## Getting Started

Note : Wordpress needs to be running on domain style URL (e.g. wordpress.local, wp.local) not Port style (e.g localhost:8000). So you need Traefik or Nginx Proxy Manager to handle domain proxy. In this example, we use traefik with domain `wordpress.local`.

Create public wordpress directory, (e.g. public)

```
$ mkdir public
```

Then, create compose.yml with following content

```
version: '3.0'
name: wordpress
services:
  db:
    container_name: wordpress_db
    image: mysql:latest
    environment:
      - MYSQL_ROOT_PASSWORD=p4ssw0rd
      - MYSQL_DATABASE=wordpress
    networks:
      - wordpress

  wp:
    container_name: wordpress_container
    image: mochrira/wordpress:latest
    volumes:
      - ./public:/var/www/html
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.wordpress.rule=Host(`wordpress.local`)"
      - "traefik.http.services.wordpress.loadbalancer.server.port=80"
    networks:
      - wordpress

networks:
  wordpress:
    name: wordpress
```

Then, run the composed file

```
$ docker compose -f compose.yml up -d --build
```

Your wordpress accessible on http://wordpress.local/

## Setup

On wordpress setup screen, specify options like below :

```
Database Host: db
Database Username: root
Database Password: p4ssw0rd
Database Name: wordpress
```