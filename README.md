# `akilli/php`

`akilli/base` based PHP 7.2 image.

Uses the `app` user that is created in the `akilli/base` image. It is configured with `opcache.revalidate_freq = 0`, which is not suitable for development (see the `etc/snippets/php.conf` in the `akilli/nginx` repository for one of several possibilities to adjust this setting for development).

## Usage

In your `docker-compose.yml` include something like

    services:
      php:
        image: akilli/php
        ports:
          - "9000:9000"
