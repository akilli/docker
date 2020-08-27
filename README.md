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

If you use these default settings, you must provide a preload script at `/app/preload.php` and be aware of the fact that changes in PHP scripts will only have effect after restarting the server which is perfect for containerized production environment. 

For development, some of these settings are surely not suitable, so you likely want to change them. There are several possibilities to adjust these default settings. You could p.e. 

- completely replace `/etc/php/7.4/mods-available/php.ini` with your own ini file,
- append your own ini file p.e. at `/etc/php/7.4/fpm/conf.d/99-zzz.ini` to just override selected values,
- use a user ini file `.user.ini` for certain settings,
- use different fpm pools or
- do something completely different.

You can use the example [docker-compose.yml](docker-compose.yml) and [docker-compose.override.yml](docker-compose.override.yml) as a starting point for your configuration.
