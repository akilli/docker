#
# Build image
#
FROM traefik AS build

#
# Final image
#
FROM akilli/base
LABEL maintainer="Ayhan Akilli"

COPY traefik-entry /usr/local/bin/traefik-entry
COPY --from=build /usr/local/bin/traefik /usr/local/bin/traefik

ENTRYPOINT ["traefik-entry"]
CMD ["traefik"]
