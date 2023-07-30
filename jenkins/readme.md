# `akilli/jenkins`

[akilli/base](../base) based jenkins image with docker-cli and the buildx and compose cli plugins preinstalled.

The docker socket must be mounted to `/var/run/docker.sock` in the container. During initialization the `docker`
group will be created with the GID of the `/var/run/docker.sock` owner group and the `app` user will be added to group
`docker` to be able to execute docker commands without the need of `sudo` or the likes.

You can use the example [compose.yml](compose.yml) as a starting point for your configuration.
