#!/bin/sh

# Substitute environment variables in the Nginx configuration template
envsubst < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

# Run the default entrypoint script from the nginx base image
/docker-entrypoint.sh "$@"
