#!/bin/bash
CERTBOT_IMAGE=certbot/certbot:v3.3.0
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

docker run \
    -it \
    --rm \
    -v "${SCRIPT_DIR}/letsencrypt/www/:/var/www/certbot/:rw" \
    -v "${SCRIPT_DIR}/letsencrypt/conf/:/etc/letsencrypt/:rw" \
    -v "${SCRIPT_DIR}/letsencrypt/log/:/var/log/letsencrypt/:rw" \
    ${CERTBOT_IMAGE} certonly --webroot --webroot-path /var/www/certbot/ \
    -d mazze.org -d auth.mazze.org -d lldap.mazze.org -d whoami.mazze.org