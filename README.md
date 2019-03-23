# `akilli/registry`

`akilli/base` based Docker Registry image.

Uses the `app` user that is created in the `akilli/base` image.

## Usage

In your `docker-compose.yml` include something like

    volumes:
      registry: {}
    services:
      registry:
        image: akilli/registry
        ports:
          - "5000:5000"
        volumes:
          - source: registry
            target: /data
            type: volume
