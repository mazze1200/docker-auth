#!/bin/bash
echo Reloading Nginx
podman exec -it nginx nginx -s reload