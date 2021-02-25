#!/bin/bash

docker login -u $DOCKER_USER -p $PASS

docker tag $JOB_NAME:$BUILD_ID $DOCKER_USER/$JOB_NAME:$BUILD_ID

docker push $DOCKER_USER/$JOB_NAME:$BUILD_ID
