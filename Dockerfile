ARG VERSION=2
FROM caddy/caddy:${VERSION}-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM cr.hotio.dev/hotio/base:alpine-20230904220610

EXPOSE 80 443 2019

RUN apk add --no-cache mailcap

COPY root/ /
RUN chmod -R +x /etc/cont-init.d/ /etc/services.d/

COPY --from=builder /usr/bin/caddy /app/caddy

RUN chmod -R u=rwX,go=rX "${APP_DIR}" && \
    ln -s "${APP_DIR}/caddy" "/usr/local/bin/caddy" && \
    apk add --no-cache libcap && \
    setcap CAP_NET_BIND_SERVICE=+eip /app/caddy
