#!/bin/bash

docker login -u $DOCKER_USER -p $PASS

docker tag $JOB_NAME:$BUILD_NUMBER $DOCKER_USER/$JOB_NAME:$BUILD_NUMBER

docker push $DOCKER_USER/$JOB_NAME:$BUILD_NUMBER
