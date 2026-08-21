# syntax=docker/dockerfile:1
FROM alpine:3.22

RUN apk add --no-cache tinyproxy

COPY <<'SCRIPT' /entrypoint.sh
#!/bin/sh
set -eu

: "${PROXY_USER:?PROXY_USER is required}"
: "${PROXY_PASSWORD:?PROXY_PASSWORD is required}"

cat > /tmp/tinyproxy.conf <<EOF
Port 8888
Listen 0.0.0.0
Timeout 600
BasicAuth ${PROXY_USER} ${PROXY_PASSWORD}
EOF

exec tinyproxy -d -c /tmp/tinyproxy.conf
SCRIPT

RUN chmod +x /entrypoint.sh

USER nobody
EXPOSE 8888

ENTRYPOINT ["/entrypoint.sh"]
