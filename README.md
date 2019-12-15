# `akilli/postgres`

`akilli/base` based PostgreSQL 12 image.

Uses the `app` user that is created in the `akilli/base` image. Creates the directory `/init/postgres` and executes all `*.sql` files in this directory on database initialisation.

You can use the example docker-compose.yml as a starting point for your configuration.
