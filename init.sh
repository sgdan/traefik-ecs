#!/bin/sh
set -e

mkdir -p /etc/traefik
envsubst < template.toml > /etc/traefik/traefik.toml

exec /entrypoint.sh $@
