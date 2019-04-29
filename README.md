# `akilli/jenkins`

`akilli/docker` based jenkins image. 

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
