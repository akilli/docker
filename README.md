# `akilli/postgres`

[akilli/base](https://github.com/akilli/base) based PostgreSQL 12 image.

Creates the directory `/init/postgres` and executes all `*.sql` files in this directory on database initialisation. Creates a database `app` and the database user `app` with the value of the `PGPASS` environment variable as password.

You can use the example [docker-compose.yml](docker-compose.yml) as a starting point for your configuration.
