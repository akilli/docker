# `akilli/nginx`

[akilli/base](../base) based nginx image with geoip and image-filter modules.

[/etc/nginx/nginx.conf](etc/nginx.conf) is configured with `include /app/nginx.conf;`, so you have to provide this file.
Some useful snippets for configuring ssl, php and more are added to the [/etc/nginx/snippets](etc/snippets) directory.

You can use the example [compose.yml](compose.yml) as a starting point for your configuration.
