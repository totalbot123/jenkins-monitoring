#!/bin/bash

echo $IMAGE_NAME > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth 
echo $PASS >> /tmp/.auth 
echo $DOCKER_USER >> /tmp/.auth

scp -i $HOME/ae.pem /tmp/.auth ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com:/tmp/.auth
scp -i $HOME/ae.pem $HOME/jenkins/monitoring/jenkins/deploy/publish.sh ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com:/tmp/publish.sh
scp -i $HOME/ae.pem $HOME/jenkins/monitoring/jenkins/deploy/docker-compose.yml ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com:/tmp/docker-compose.yml
ssh -i $HOME/ae.pem ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com "/tmp/publish.sh" 
