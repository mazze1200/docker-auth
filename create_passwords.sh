#!/bin/bash
set -e
echo "Generating passwords. Please store them securely"

LLDAP_JWT_SECRET=$(openssl rand -base64 32 | tr -dc 'a-zA-Z0-9')
#printf "$LLDAP_JWT_SECRET" | docker secret create LLDAP_JWT_SECRET -

LLDAP_KEY_SEED=$(openssl rand -base64 32 | tr -dc 'a-zA-Z0-9')
#printf "$LLDAP_KEY_SEED" | docker secret create LLDAP_KEY_SEED -

LLDAP_LDAP_USER_PASS=$(openssl rand -base64 32 | tr -dc 'a-zA-Z0-9')
#printf "$LLDAP_LDAP_USER_PASS" | docker secret create LLDAP_LDAP_USER_PASS -

sed -i -e 's/"LLDAP_JWT_SECRET"/"'"${LLDAP_JWT_SECRET}"'"/g' \
    -e 's/"LLDAP_KEY_SEED"/"'"${LLDAP_KEY_SEED}"'"/g' \
    -e 's/"LLDAP_LDAP_USER_PASS"/"'"${LLDAP_LDAP_USER_PASS}"'"/g' \
    lldap/data/lldap_config.toml


echo LLDAP_JWT_SECRET: $LLDAP_JWT_SECRET
echo LLDAP_KEY_SEED: $LLDAP_KEY_SEED
echo LLDAP_LDAP_USER_PASS: $LLDAP_LDAP_USER_PASS

echo finished.


