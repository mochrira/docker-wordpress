# Wordpress

## Create Wordpress Directory

```
mkdir -p private/wordpress
sudo chmod 777 -R private/wordpress
```

## Build Wordpress

```
docker compose -f compose.yaml up -d --build
```

## Connect to Database Network

This repository doesn't contains mariadb container, so you need to setup mariadb your self or follow instruction on my docker-database repository. To setup wordpress using existing database installation, you need to open your portainer, connect wordpress to database network or execute following command

```
docker network connect database wordpress
```

## Configure Nginx Proxy Manager

Open your /etc/hosts, add following lines

```
127.0.0.1 wordpress.local
::1 wordpress.local
```

Then, open your portainer, connect nginx to wordpresss network or execute following command

```
docker network connect wordpresss nginx
```

Then, open Nginx Proxy Manager web interface, add proxy host wordpress.local refers to http://web.wordpress:80/