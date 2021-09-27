FROM caddy/caddy:2.4.5-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-auth-jwt


FROM ghcr.io/hotio/base:alpine

EXPOSE 80 443 2019

RUN apk add --no-cache mailcap

RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

COPY root/ /

COPY --from=builder /usr/bin/caddy /app/caddy

RUN chmod -R u=rwX,go=rX "${APP_DIR}" && \
    ln -s "${APP_DIR}/caddy" "/usr/local/bin/caddy" && \
    apk add --no-cache libcap && \
    setcap CAP_NET_BIND_SERVICE=+eip /app/caddy
