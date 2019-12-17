# `akilli/node`

`akilli/base` based node.js image for direct usage or as extension point.

Creates a user and group `node` with uid and gid 1000. The `/srv` is automatically `chown`ed to this user and group at start-up, so you might want to add you application code at this location, but also could use any other location.

You can use the example docker-compose.yml to start a container and have a look around within this image.
