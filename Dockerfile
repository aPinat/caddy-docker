FROM caddy:2.8.4-builder-alpine@sha256:4ad9121d96b2aa96464af5bc9824dbee003901ae9314f2127f0ecf0f62ccfff7 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:a994e3abc186b932d77628238c78e6a0a5a1a8ad0ce4628c952fe9ab75638064

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
