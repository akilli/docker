# `akilli/base`

Base image built from `alpine:edge` with `s6`, `su-exec` and `libintl`, `crond`-support, configured locale (default: `de_DE.UTF-8`) and timezone (default: `Europe/Berlin`), a user and group named `app` with UID/GID `1000` as well as the custom directories `/app`, `/data` and `/home/app` owned by user `app` and the directories `/init` and `/s6`.

A default entrypoint `app-entry` is provided and ensures that all executable scripts wihin the `/init`, p.e. to set proper ownership of the custom directories, are executed by `run-parts` before executing the passed `CMD` command (default: `s6-svscan /s6`). The pre-configured `s6` scan directory is `/s6`.

You can use the example docker-compose.yml to start a container and have a look around within this image.
