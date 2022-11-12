# `akilli/jenkins`

[akilli/base](../base) based jenkins image with `docker-cli`, `docker-cli-compose`, `docker-cli-buildx`, `git` and `sudo`.

For backwards compatibility the compose plugin is symlinked to `/usr/bin/docker-compose` so you can use both `docker compose` and `docker-compose` commands.

The `app` user is allowed to execute `docker`and `docker-compose` commands with `sudo`.

You can use the example [compose.yml](compose.yml) as a starting point for your configuration.
