#!/bin/bash

current_dir=$(pwd)


docker stop nginx-empty-gif   >/dev/null 2>&1
docker rm nginx-empty-gif     >/dev/null 2>&1
docker network create tknet   >/dev/null 2>&1
docker run --network tknet \
  -v "${current_dir}"/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v "${current_dir}"/log:/var/log/nginx \
  -v "${current_dir}"/www:/usr/share/nginx/html:ro \
  --name nginx-empty-gif \
  -d \
  nginx



