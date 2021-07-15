FROM caddy/caddy:2.4.3-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-webdav


FROM ghcr.io/hotio/base:alpine

EXPOSE 80 443 2019

COPY root/ /

COPY --from=builder /usr/bin/caddy /app/caddy

RUN chmod -R u=rwX,go=rX "${APP_DIR}" && \
    ln -s "${APP_DIR}/caddy" "/usr/local/bin/caddy" && \
    apk add --no-cache libcap && \
    setcap CAP_NET_BIND_SERVICE=+eip /app/caddy
