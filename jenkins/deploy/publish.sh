#!/bin/bash

export IMAGE_NAME=$(sed -n '1p' /tmp/.auth)
export BUILD_TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)
export DOCKER_USER=$(sed -n '4p' /tmp/.auth)

docker login -u $DOCKER_USER -p $PASS
cd /tmp/ && docker-compose up -d
