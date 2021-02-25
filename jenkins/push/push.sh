#!/bin/bash

docker login -u $DOCKER_USER -p $PASS

docker tag $IMAGE_NAME:$BUILD_TAG $DOCKER_USER/$IMAGE_NAME:$BUILD_TAG

docker push $DOCKER_USER/$IMAGE_NAME:$BUILD_TAG
