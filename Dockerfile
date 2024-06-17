FROM caddy:2.8.4-builder-alpine@sha256:ae1e0367c86a6adaf620ce70ad4a6b04b04c2f27f5d1ae3e75c17ce53591ff69 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:a48e22edad925dc216fd27aa4f04ec49ebdad9b64c9e5a3f1826d0595ef2993c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
