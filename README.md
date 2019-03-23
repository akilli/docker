# `akilli/gogs`

`akilli/base` based Gogs image including MySQL, PostgreSQL, SQLite and TiDB support. 

Runs as `app` user that is created in the `akilli/base` image.

## Usage

In your `docker-compose.yml` include something like

    volumes:
      gogs: {}
    services:
      gogs:
        image: akilli/gogs
        ports:
          - "3000:3000"
        volumes:
          - source: gogs
            target: /data
            type: volume
