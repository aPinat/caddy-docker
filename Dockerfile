FROM caddy:2.8.4-builder-alpine@sha256:9f4c8965330d05617a8228c958c7c67098353fcc75d1703d1a60b269065dde5f AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:2597ffaba95118cc8f444144052544bcbbd9018c26dde150ace3aa38f79bc125

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
