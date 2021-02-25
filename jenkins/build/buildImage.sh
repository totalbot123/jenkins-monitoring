#!/bin/bash

IMAGE_NAME="monitoring"
ENV=$HOME/environment
APP_FOLDER="$HOME/monitoring"

cd "$APP_FOLDER"
git pull origin master

# Build sit image
cp $ENV/sitSettings.json $APP_FOLDER/flask_web/saml/settings.json
cp $ENV/sitNginx.conf $APP_FOLDER/nginx/nginx.conf
docker build . -t $IMAGE_NAME:$BUILD_TAG-SIT

# Build prod image
cp $ENV/prodSettings.json $APP_FOLDER/flask_web/saml/settings.json
cp $ENV/prodNginx.conf $APP_FOLDER/nginx/nginx.conf
docker build . -t $IMAGE_NAME:$BUILD_TAG
