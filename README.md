# `akilli/base`

Base image built from `alpine:edge` with 

- `ca-certificates`, `libintl`, `s6` and `su-exec` packages pre-installed, 
- `crond`-support, 
- a user and group `app` with UID and GID _1000_,
- configured locale (default: `de_DE.UTF-8`) using [musl-locales](https://gitlab.com/rilian-la-te/musl-locales), 
- configured timezone (default: `Europe/Berlin`) and a helper script `app-timezone` to change it, 
- the `/app`, `/data`, `/init` and `/s6` directories,
- the pre-configured `s6` scan directory `/s6`,
- the default entrypoint `app-entry` and
- the default command `s6-svscan /s6`.

The default entrypoint ensures that all executable scripts within the `/init` directory are executed by `run-parts` before the command. The `/init/00-chown` script changes owner and group for `/app`, `/data`, `/home/app`, `/opt` and `/var/log` to `app`.

You can use the example docker-compose.yml to start a container and have a look around within this image.
