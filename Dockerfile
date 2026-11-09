FROM caddy:2.11.8-builder-alpine@sha256:e42a64b3bc70aa3a1387bde85b930e507a378fecae5852d5bfde9dcd37d0b999 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/cloudflare


FROM caddy:2.11.9-alpine@sha256:0bbb055bda6793c999bde78b1b5ce3e89f829fb031af2cf50056ea1246559fee

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
