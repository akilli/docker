# `akilli/base`

Base image built from `alpine:edge` with 

- `ca-certificates`, `libintl`, `s6` and `su-exec` packages pre-installed, 
- `crond`-support, 
- configured locale (default: `de_DE.UTF-8`) using [musl-locales](https://gitlab.com/rilian-la-te/musl-locales), 
- configured timezone (default: `Europe/Berlin`) and a helper script `app-timezone` to change it, 
- the `/init` and `/s6` directories and
- the pre-configured `s6` scan directory `/s6`,
- the default entrypoint `app-entry` and
- the default command `s6-svscan /s6`.

The default entrypoint ensures that all executable scripts within the `/init` directory are executed by `run-parts` before the command.

You can use the example docker-compose.yml to start a container and have a look around within this image.
