# `akilli/nginx`

`akilli/base` based nginx image. 

Uses the `app` user that is created in the `akilli/base` image. `/etc/nginx/nginx.conf` is configured with `include /app/nginx.conf;`, so you have to provide this file. Some useful snippets for `ssl`, `http2` and `php-fpm` configuration are added to the `/etc/nginx/snippets` directory.

## Usage

In your `docker-compose.yml` include something like

    services:
      nginx:
        image: akilli/nginx
        ports:
          - "80:80"
          - "443:443"
        volumes:
          - source: .
            target: /app
            type: bind
