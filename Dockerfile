FROM caddy:2.8.4-builder-alpine@sha256:0e1004d358d34d08880969fa44f625612d155ea7de6efee876d04aaab8fefb5f AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:221bcf3be161b0d856bdb7bea76b42386d732d19348f79692404829532d83f4a

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
