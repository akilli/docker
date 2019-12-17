# `akilli/base`

Base image built from `alpine:edge` with 

- `ca-certificates`, `libintl`, `s6` and `su-exec` packages pre-installed, 
- `crond`-support, 
- configured locale (default: `de_DE.UTF-8`) and timezone (default: `Europe/Berlin`), 
- a user and group named `app` with UID/GID `1000` and 
- the custom directories `/app`, `/data` (owned by user `app`), `/init` and `/s6`.

Besides that, a default entrypoint `app-entry` is provided and ensures that all executable scripts within the `/init` are executed by `run-parts` before executing the passed `CMD` command (default: `s6-svscan /s6`). The pre-configured `s6` scan directory is `/s6`.

You can use the example docker-compose.yml to start a container and have a look around within this image.
