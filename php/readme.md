# `akilli/php`

[akilli/base](../base) based PHP 8 image.

This images comes with a custom configuration file at `/etc/php/conf.d/90_php.ini` that is pre-configured for
production, amongst others, with

- `opcache.jit = 1255`,
- `opcache.preload = /app/preload.php`,
- `opcache.validate_timestamps = 0`,
- `opcache.revalidate_freq = 0` and
- strict sessions.

If you use these default settings, you must provide a preload script at `/app/preload.php` and be aware of the fact that
changes in PHP scripts will only have effect after restarting the server which is perfect for containerized production
environment.

Some of these settings are surely not suitable for development. If you set the environment variable `DEV=1`,
the [init/10-php](./init/10-php) script will enable the [dev configuration file](etc/conf.d/99_dev.ini.disabled) that
will effectively disable the `session.cookie_secure` restriction and opcache and also auto-prepend the preload script
at `/app/preload.php` instead.

Apart from that, there are several possibilities to adjust these default settings. You could p.e.

- completely replace `/etc/php/conf.d/90_php.ini` with your own ini file,
- append your own ini file p.e. at `/etc/php/conf.d/99-zzz.ini` to just override selected values,
- use a user ini file `.user.ini` for certain settings,
- use different fpm pools or
- do something completely different.

You can use the example [compose.yml](compose.yml) and [compose.override.yml](compose.override.yml) as a starting point
for your configuration.
