# `akilli/jenkins`

`akilli/base` based jenkins image that includes `sudo`, `docker` and `docker-compose`. 

Runs as `app` user that is created in the `akilli/base` image. `sudo` is configured to allow the `app` user execution of `docker`and `docker-compose` commands. 

## Usage

In your `docker-compose.yml` include something like

    volumes:
      jenkins: {}
    services:
      jenkins:
        image: akilli/jenkins
        ports:
          - "8080:8080"
        volumes:
          - source: jenkins
            target: /data
            type: volume
          - source: /var/run/docker.sock
            target: /var/run/docker.sock
            type: bind
            read_only: true
