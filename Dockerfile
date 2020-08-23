FROM alpine:edge
LABEL maintainer="Ayhan Akilli"

ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin
ENV LANG=$LANG
ENV MUSL_LOCPATH=/usr/share/i18n/locales/musl

COPY bin/ /usr/local/bin/
RUN apk add --no-cache \
        ca-certificates \
        musl-locales \
        musl-locales-lang \
        su-exec && \
    app-dir && \
    app-user && \
    app-timezone "$TZ"
COPY init/ /init/

ENTRYPOINT ["app-entry"]
CMD ["su-exec", "app", "sh"]
