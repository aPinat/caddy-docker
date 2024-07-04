FROM caddy:2.8.4-builder-alpine@sha256:87e32379e55b89b32f4f6ba4287e14b99e44420d098a7aa8461836d4f104de5e AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:896c6fb9e3eae11890f53dc528b8a9be1b4d058f6b7603024feb084fc203c0b4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
