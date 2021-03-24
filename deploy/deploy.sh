#!/bin/bash

echo $JOB_NAME > /tmp/.auth
echo $BUILD_NUMBER >> /tmp/.auth 
echo $PASS >> /tmp/.auth 
echo $DOCKER_USER >> /tmp/.auth

scp -i $HOME/ae.pem /tmp/.auth ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com:/tmp/.auth
scp -i $HOME/ae.pem $HOME/jenkins/monitoring/deploy/publish.sh ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com:/tmp/publish.sh
scp -i $HOME/ae.pem $HOME/monitoring/docker-compose-deploy.yml ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com:/tmp/docker-compose.yml
ssh -i $HOME/ae.pem ubuntu@ec2-3-122-41-72.eu-central-1.compute.amazonaws.com "/tmp/publish.sh" 
