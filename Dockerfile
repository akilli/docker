FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN addgroup -g 1000 www-data && \
    adduser -u 1000 -G www-data -s /bin/ash -D nginx && \
    apk add --no-cache \
        nginx \
        nginx-mod-http-geoip \
        nginx-mod-http-image-filter \
        openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048 && \
    chown -R nginx:www-data /var/lib/nginx && \
    rm -rf /etc/nginx/conf.d/default.conf

COPY etc/ /etc/nginx/
COPY init/ /init/
COPY s6/ /s6/nginx/
COPY default.conf /srv/nginx.conf
