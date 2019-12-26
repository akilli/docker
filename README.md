# `akilli/nginx`

`akilli/base` based nginx image with geoip and image-filter modules.

`/etc/nginx/nginx.conf` is configured with `include /app/nginx.conf;`, so you have to provide this file. Some useful snippets for `ssl`, `http2` and `php-fpm` configuration are added to the `/etc/nginx/snippets` directory.

You can use the example docker-compose.yml as a starting point for your configuration.
