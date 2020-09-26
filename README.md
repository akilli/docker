# `akilli/php`

[akilli/base](https://github.com/akilli/base) based PHP 7.4 image.

This images comes with a custom configuration file at `/etc/php/7.4/mods-available/php.ini` that is symlinked to

- `/etc/php/7.4/cli/conf.d/90-php.ini`
- `/etc/php/7.4/fpm/conf.d/90-php.ini`

This custom configuration file is pre-configured for production, amongst others, with

- `opcache.preload = /app/preload.php`,
- `opcache.validate_timestamps = 0`,
- `opcache.revalidate_freq = 0` and
- strict sessions.

If you use these default settings, you must provide a preload script at `/app/preload.php` and be aware of the fact that changes in PHP scripts will only have effect after restarting the server which is perfect for containerized production environment. xdebug is installed, but disabled.

Some of these settings are surely not suitable for development. If you set the environment variable `DEV=1`, the [init/10-php](./init/10-php) script will enable the xdebug extension and also the [mods-available/dev.ini](./mods-available/dev.ini) configuration file, that will effectively disable the `session.cookie_secure` restriction and opcache and also auto-prepend the preload script at `/app/preload.php` instead.

Apart from that, there are several possibilities to adjust these default settings. You could p.e. 

- completely replace `/etc/php/7.4/mods-available/php.ini` with your own ini file,
- append your own ini file p.e. at `/etc/php/7.4/fpm/conf.d/99-zzz.ini` to just override selected values,
- use a user ini file `.user.ini` for certain settings,
- use different fpm pools or
- do something completely different.

You can use the example [docker-compose.yml](docker-compose.yml) and [docker-compose.override.yml](docker-compose.override.yml) as a starting point for your configuration.
