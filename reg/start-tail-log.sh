#!/bin/bash

current_dir=$(pwd)
docker_container_name="tail-log-reg"

docker stop ${docker_container_name}        >/dev/null 2>&1
docker rm ${docker_container_name}          >/dev/null 2>&1
docker network create tknet                 >/dev/null 2>&1

docker run -d \
  -p 18083:8080 \
  --network tknet \
  -v "${current_dir}"/log:/tailon \
  --name ${docker_container_name} \
  gvalkov/tailon \
  /tailon/*.log

