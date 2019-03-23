# `akilli/base`

A quite minimal base image built from `alpine:latest` with pre-installed `s6` package, `crond`-support, configured locale (default: `de_DE.UTF-8`) and timezone (default: `Europe/Berlin`), a user and group named `app` with UID/GID `1000` as well as the custom directories `/app`, `/data` and `/home/app` owned by user `app` and the directory `/init`.

A default entrypoint `app-entry` is provided and ensures that all executable scripts wihin the `/init`, p.e. to set proper ownership of the custom directories, are executed by `run-parts` before executing the passed `CMD` command (default: `s6-svscan /etc/s6`). The pre-configured `s6` scan directory is `/etc/s6`. Please see the other `akilli` images that are all derived from this image.
