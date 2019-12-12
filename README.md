# `akilli/nginx`

`akilli/base` based nginx image with `nginx-mod-http-geoip` and `nginx-mod-http-image-filter`.

Uses the `app` user that is created in the `akilli/base` image. `/etc/nginx/nginx.conf` is configured with `include /app/nginx.conf;`, so you have to provide this file. Some useful snippets for `ssl`, `http2` and `php-fpm` configuration are added to the `/etc/nginx/snippets` directory.

You can use [`docker-compose.yml`](https://github.com/akilli/docker/blob/master/nginx/docker-compose.yml) as a starting point for your configuration.
