FROM traefik:1.7.12-alpine

# Install for "envsubst"
RUN apk add --no-cache gettext

COPY template.toml /
COPY init.sh /
RUN chmod a+x /init.sh
RUN mkdir -p /acme && touch /acme/acme.json && chmod 0600 /acme/acme.json

ENV LOG_LEVEL DEBUG
ENV CLUSTER main
ENV DOMAIN example.com
ENV AWS_REGION us-east-1
ENV EMAIL me@my.domain.com

ENTRYPOINT ["/init.sh"]
