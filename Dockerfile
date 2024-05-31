FROM caddy:2.8.1-builder-alpine@sha256:9b0e5fefc8876b84dc74dd15b7413da6ad26b0642a4fb11d8f37399ad47fa572 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.1-alpine@sha256:54b067d60ae306670ab09f10b6f309f19e4e0f43927ae514d3740fbe7964872f

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
