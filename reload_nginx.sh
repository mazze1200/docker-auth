#!/bin/bash
echo Reloading Nginx
docker exec -it nginx nginx -s reload
