# `akilli/base`

Base image built from `alpine:edge` with 

- `ca-certificates`, `musl-locales`, `su-exec` and `tzdata` pre-installed, 
- an user and group `app` with UID and GID _1000_,
- configured locale (default: `de_DE.UTF-8`), 
- configured timezone (default: `Europe/Berlin`) and a helper script `app-timezone` to change it, 
- the `/app`, `/data` and `/init` directories,
- the default entrypoint `app-entry` and
- additional helper scripts.

The default entrypoint ensures that all executable scripts within the `/init` directory are executed by `run-parts` before the command. The `/init/00-chown` script changes owner and group for `/app`, `/data`, `/home/app`, `/opt` and `/var/log` to `app`.

You can use the example [compose.yml](compose.yml) to start a container and have a look around within this image.

## Change timezone

```
FROM akilli/base
ENV TZ=Europe/Berlin
RUN app-timezone
```
