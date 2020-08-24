# `akilli/base`

Base image built from `ubuntu:focal` with 

- `ca-certificates` and `su-exec` pre-installed, 
- an user and group `app` with UID and GID _1000_,
- configured locale (default: `de_DE.UTF-8`) and a helper script `app-locale` to change it, 
- configured timezone (default: `Europe/Berlin`) and a helper script `app-timezone` to change it, 
- the `/app`, `/data` and `/init` directories,
- the default entrypoint `app-entry` and
- additional helper scripts.

The default entrypoint ensures that all executable scripts within the `/init` directory are executed by `run-parts` before the command. The `/init/00-chown` script changes owner and group for `/app`, `/data`, `/home/app`, `/opt` and `/var/log` to `app`.

You can use the example [docker-compose.yml](docker-compose.yml) to start a container and have a look around within this image.

## Change locale

```
# Usage: app-locale LANGUAGE LANG
app-locale de_DE de_DE.UTF-8
```

## Change timezone

```
# Usage: app-timezone TZ
app-timezone Europe/Berlin
```
