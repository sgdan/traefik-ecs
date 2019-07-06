FROM traefik:1.7.12-alpine

# Install for "envsubst"
RUN apk add --no-cache gettext

COPY https.toml /
COPY http.toml /
COPY init.sh /
RUN chmod a+x /init.sh

# Will store cert details inside container. Should really be on a volume
# if container can restart, otherwise letsencrypt request limits will be hit.
RUN mkdir -p /acme && touch /acme/acme.json && chmod 0600 /acme/acme.json

ENV LOG_LEVEL DEBUG
ENV CLUSTER main
ENV DOMAIN example.com
ENV AWS_REGION us-east-1
ENV EMAIL me@my.domain.com

# Use "https" for the template with letsencrypt support
ENV TEMPLATE http

# For prod use https://acme-v02.api.letsencrypt.org/directory
ENV CA_SERVER https://acme-staging-v02.api.letsencrypt.org/directory

ENTRYPOINT ["/init.sh"]
