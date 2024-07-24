FROM caddy:2.8.4-builder-alpine@sha256:1f3201aa7f4f751c2682d51f2097629b580e50e5ab125fcca26cfb27cc93e383 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:716f31d3d18d8a9e2a0a89dc0d188d5d2a27ea86935cdd222ad454b0c5bf354a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
