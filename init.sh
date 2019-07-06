#!/bin/sh
set -e

mkdir -p /etc/traefik
envsubst < ${TEMPLATE}.toml > /etc/traefik/traefik.toml

exec /entrypoint.sh $@
