FROM caddy:2.8.4-builder-alpine@sha256:382f17ed2637ec63f46105efb2c6b8a3226802a1cca7b32ef2526c844768017b AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:4215a674b064e34507e5b58395ec2e0775070a997e7e0e0663bd3933b6f37b5b

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
