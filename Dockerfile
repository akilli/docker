FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Environment variables
#
ENV PGDATA=/data \
    PGPASS=app

#
# Setup
#
RUN apk add --no-cache \
        postgresql \
        postgresql-contrib && \
    rm -rf /var/lib/postgresql && \
    mkdir -p \
        /init/postgres \
        /run/postgresql && \
    chown -R app:app /run/postgresql

COPY rootfs/ /

#
# Ports
#
EXPOSE 5432
