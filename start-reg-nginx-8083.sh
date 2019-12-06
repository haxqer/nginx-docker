#!/bin/bash

current_dir=$(pwd)
docker_container_name="nginx-reg"

docker stop ${docker_container_name}   >/dev/null 2>&1
docker rm ${docker_container_name}     >/dev/null 2>&1
docker network create tknet   >/dev/null 2>&1
docker run --network tknet \
  -p 8083:80 \
  -v "${current_dir}"/reg/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v "${current_dir}"/reg/log:/var/log/nginx \
  -v "${current_dir}"/reg/www:/usr/share/nginx/html:ro \
  --name ${docker_container_name} \
  -e TZ="Asia/Shanghai" \
  -d \
  nginx




