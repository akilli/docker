# `akilli/jenkins`

[akilli/base](../base) based jenkins image with `docker-cli`, `docker-cli-compose`, `docker-cli-buildx`, `git`
and `sudo`.

Note that Docker Compose is installed as a CLI plugin, so you have to use `docker compose`.

The `app` user is allowed to execute the `docker` command with `sudo`.

You can use the example [compose.yml](compose.yml) as a starting point for your configuration.
