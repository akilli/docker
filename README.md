# `akilli/postgres`

`akilli/base` based PostgreSQL image.

Uses the `app` user that is created in the `akilli/base` image. Creates the directory `/init/postgres` and executes all `*.sql` files in this directory on database initialisation.

You can use [`docker-compose.yml`](https://github.com/akilli/docker/blob/master/postgres/docker-compose.yml) as a starting point for your configuration.
