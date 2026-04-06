# `akilli/stalwart`

[akilli/base](../base) based stalwart image.

The default config 

- expects the TLS certificate file at `/ssl/app.crt`
- expects the TLS private key file at `/ssl/app.key`
- uses `STALWART_HOST` environment variable to set server hostname
- uses `STALWART_PASSWORD` environment variable to set `admin` user password (see stalwart docs for hashing schemes)

Alternatively, you can mount your own config to `/app/config.toml`.

You can use the example [compose.yml](compose.yml) as a starting point for your configuration.
