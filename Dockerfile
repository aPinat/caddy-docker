FROM caddy:2.8.0-builder-alpine@sha256:e7dc640da624304403b0999001caad2daf4fb6a198b6ab6d1594e5c166e7d0ec AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.0-alpine@sha256:974febc057d382387274866a3b1bfd7fa3a232cacc94f4a1bf78792b0bfd9300

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
