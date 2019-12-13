# `akilli/php`

`akilli/base` based PHP 7.4 image. 

Uses the `app` user that is created in the `akilli/base` image. It is, among others, configured with `opcache.revalidate_freq = 0` and `user_ini.filename = .php.ini`. This `opcache.revalidate_freq = 0` is not suitable for development, but there are several possibilities to adjust this and other settings for production and development, p.e. you can have a look at the PHP configuration and snippets in the `akilli/nginx` repository that adjust `opcache.revalidate_freq`, `opcache.preload` and `auto_prepend_file` for local development, in case the domain ends with `.loc`, or for production for all other domains. Another alternative is to use the environment variable `PHP_INI_SCAN_DIR` and a custom ini file to set default options for production and use `.php.ini` to override settings for local development. Or you could use different fpm pools.

You can use [`docker-compose.yml`](https://github.com/akilli/docker/blob/master/php/docker-compose.yml) as a starting point for your configuration.
