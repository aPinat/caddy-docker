FROM caddy:2.8.4-builder-alpine@sha256:5165bfa57942527efe8832020e1f454f442ed3b3304c0bbc1ee8ecdff526dda8 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:e1907e29d6abf9aea25be92287e6ee1e1c2a6afa220a41984e37c6f9fe9248aa

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
