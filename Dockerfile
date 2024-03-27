FROM caddy:2.7.6-builder-alpine@sha256:fd9d8fc07ef53ffdb2c55e5eaf90f575f0742a80eca6a85d28000ae766838cc2 AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.7.6-alpine@sha256:95ce04978787e23e35143d23b8af2fbb6d6de55213b54a2e9ed2dbf8ffe7313c

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
