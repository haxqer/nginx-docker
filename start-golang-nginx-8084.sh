#!/bin/bash

current_dir=$(pwd)
docker_container_name="nginx-golang"

docker stop ${docker_container_name}   >/dev/null 2>&1
docker rm ${docker_container_name}     >/dev/null 2>&1
docker network create tknet   >/dev/null 2>&1
docker run --network host \
  -p 8084:80 \
  -v "${current_dir}"/golang/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v "${current_dir}"/golang/log:/var/log/nginx \
  -v "${current_dir}"/golang/www:/usr/share/nginx/html:ro \
  --name ${docker_container_name} \
  -e TZ="Asia/Shanghai" \
  -d \
  nginx




