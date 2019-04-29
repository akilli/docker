FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Environment variables
#
ENV REGISTRY_CONFIG=/etc/docker-registry/config.yml

#
# Setup
#
RUN apk add --no-cache \
        docker-registry && \
    rm -rf /var/lib/registry

COPY config.yml /etc/docker-registry/config.yml
COPY s6/ /etc/s6/registry/

#
# Ports
#
EXPOSE 5000
