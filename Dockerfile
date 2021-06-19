FROM caddy/caddy:2.4.3-builder-alpine AS builder
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-webdav

FROM caddy/caddy:2.4.3-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
LABEL org.opencontainers.image.source = "https://github.com/aPinat/caddy-docker-custom"