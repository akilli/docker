FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Setup
#
RUN apk add --no-cache \
        docker-registry && \
    rm -rf /var/lib/registry

COPY etc/ /etc/

#
# Ports
#
EXPOSE 5000
