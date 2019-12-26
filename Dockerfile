FROM alpine:edge

LABEL maintainer="Ayhan Akilli"

ARG LANG=de_DE.UTF-8
ARG TZ=Europe/Berlin

ENV LANG=$LANG
ENV MUSL_LOCPATH=/usr/share/i18n/locales/musl

COPY bin/ /usr/local/bin/

RUN apk add --no-cache \
        ca-certificates \
        s6 \
        su-exec && \
    app-dir && \
    app-user && \
    app-timezone "$TZ" && \
    app-locale

COPY init/ /init/
COPY s6/ /s6/

ENTRYPOINT ["app-entry"]

CMD []
