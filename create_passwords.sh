#!/bin/bash
set -e
echo "Generating passwords. Please store them securely"

LLDAP_JWT_SECRET=$(openssl rand -base64 32)
printf "$LLDAP_JWT_SECRET" | docker secret create LLDAP_JWT_SECRET -

LLDAP_KEY=$(openssl rand -base64 64)
printf "$LLDAP_KEY" | docker secret create LLDAP_KEY -

LLDAP_LDAP_USER_PASS=$(openssl rand -base64 32)
printf "$LLDAP_LDAP_USER_PASS" | docker secret create LLDAP_LDAP_USER_PASS -

echo LLDAP_JWT_SECRET: $LLDAP_JWT_SECRET
echo LLDAP_KEY: $LLDAP_KEY
echo LLDAP_LDAP_USER_PASS: $LLDAP_LDAP_USER_PASS

echo finished.


