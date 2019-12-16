FROM akilli/base

LABEL maintainer="Ayhan Akilli"

RUN apk add --no-cache \
        nginx \
        nginx-mod-http-geoip \
        nginx-mod-http-image-filter \
        openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048 && \
    chown -R app:app /var/lib/nginx && \
    rm -rf /etc/nginx/conf.d/default.conf

COPY etc/ /etc/nginx/
COPY s6/ /s6/nginx/
COPY default.conf /app/nginx.conf
