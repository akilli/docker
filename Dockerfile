#
# Build image
#
FROM ubuntu:focal AS build

ARG DEBIAN_FRONTEND=noninteractive

COPY bin/ /usr/local/bin/
RUN app-install \
        build-essential \
        ca-certificates \
        git && \
    git clone https://github.com/ncopa/su-exec.git /tmp/su-exec && \
    cd /tmp/su-exec && \
    make

#
# Final image
#
FROM ubuntu:focal
LABEL maintainer="Ayhan Akilli"

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=de_DE.UTF-8
ARG LANGUAGE=de_DE
ARG TZ=Europe/Berlin
ENV LANG=$LANG
ENV LANGUAGE=$LANGUAGE
ENV TZ=$TZ

COPY --from=build /tmp/su-exec/su-exec /usr/local/bin/su-exec
COPY bin/ /usr/local/bin/
RUN app-install \
        ca-certificates \
        locales \
        tzdata && \
    localedef -i $LANGUAGE -c -f UTF-8 -A /usr/share/locale/locale.alias $LANG && \
    app-timezone && \
    app-user && \
    app-dir && \
    app-clean
COPY init/ /init/

ENTRYPOINT ["app-entry"]
CMD ["su-exec", "app", "bash"]
