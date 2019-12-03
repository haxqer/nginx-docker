#!/bin/bash

current_dir=$(pwd)
docker_container_name="nginx-empty-gif"

docker stop ${docker_container_name}   >/dev/null 2>&1
docker rm ${docker_container_name}     >/dev/null 2>&1
docker network create tknet   >/dev/null 2>&1
docker run --network tknet \
  -p 8080:80 \
  -v "${current_dir}"/swoft/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v "${current_dir}"/swoft/log:/var/log/nginx \
  -v "${current_dir}"/swoft/www:/usr/share/nginx/html:ro \
  --name nginx-swoft \
  -e TZ="Asia/Shanghai" \
  -d \
  nginx



