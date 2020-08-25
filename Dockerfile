FROM akilli/base
LABEL maintainer="Ayhan Akilli"

ARG DEBIAN_FRONTEND=noninteractive
ENV PATH=/usr/lib/postgresql/12/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PGDATA=/data
ENV PGPASS=app

RUN app-install \
        postgresql-12 \
        postgresql-contrib-12 && \
    rm -rf /var/lib/postgresql && \
    mkdir -p /init/postgres && \
    chown -R app:app /run/postgresql && \
    app-clean
COPY init/ /init/

CMD ["su-exec", "app", "postgres"]
