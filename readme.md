# Basic Authentication setup

## Configuration
First you need to update the domain in 
- letsencrypt_configure.sh
- nginx/etc/nginx/sites-available/default.conf
- docker-compose.yaml: LLDAP_LDAP_BASE_DN

## Create local docker network
```code
docker network create http 
```

## Create Wireguard Config 
For this you need to have wireguard-tools installed

```code
$ create_wireguard.sh 
```

## Create passwords and secrets for Authelia and LLDAP

```code
$ create_passwords.sh 
```

## Create letsencrypt certificates
First we need to comment out the HTTPS sites since we don't have TLS certificates yet

```code
    include /etc/nginx/conf.d/*.conf;
    # include /etc/nginx/sites-enabled/*.conf;
}
```

After that we need to start NGINX by docker-compose
```code
docker-compose up
```

Now configure letsencrypt
```code
$ ./letsencrypt_configure.sh
```
and follow the instructions.

The output of the letsencrypt certs creation contains the paths for the letsencrypt certs. Update them in  
- nginx/etc/nginx/ssl_certs.conf

accordingly

Now we need to reactive the (uncomment) the HTTPS sites and reload NGINX again
```code
$ ./reload_nginx.sh
``` 

That should be it now your site should be HTTPS secured.