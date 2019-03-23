# `akilli/postgres`

`akilli/base` based PostgreSQL image.

Uses the `app` user that is created in the `akilli/base` image. Creates the directory `/init/postgres` and executes all `*.sql` files in this directory on database initialisation.

## Usage

In your `docker-compose.yml` include something like

    volumes:
      postgres: {}
    services:
      postgres:
        image: akilli/postgres
        ports:
          - "5432:5432"
        volumes:
          - source: postgres
            target: /data
            type: volume
