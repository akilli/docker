# `akilli/redis`

[akilli/base](../base) based redis image.

This image uses authentication via ACL. You can use the `REDIS_PASSWORD` environment variable to set the password for 
the `app` user or mount your own ACL config to `/etc/redis.acl`.

You can use the example [compose.yml](compose.yml) as a starting point for your configuration.
