FROM caddy:2.8.4-builder-alpine@sha256:21dc27cb6464a19f4f1dbbe66702601c8d860aff1c9c5552097d4743c077be53 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:221bcf3be161b0d856bdb7bea76b42386d732d19348f79692404829532d83f4a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
