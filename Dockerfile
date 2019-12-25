FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN addgroup -g 1000 node && \
    adduser -u 1000 -G node -s /bin/ash -D node && \
    apk add --no-cache \
        nodejs \
        npm

COPY init/ /init/
