FROM akilli/base

LABEL maintainer="Ayhan Akilli"

#
# Setup
#
RUN apk add --no-cache \
        nginx \
        nginx-mod-http-geoip \
        nginx-mod-http-image-filter \
        openssl && \
    rm /etc/nginx/conf.d/default.conf && \
    chown app:app /var/tmp/nginx && \
    mkdir /etc/nginx/ssl && \
    openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048

COPY rootfs/ /

#
# Ports
#
EXPOSE 80 443
