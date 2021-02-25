#!/bin/bash

ENV=$HOME/environment
APP_PATH="$HOME/monitoring"

cd "$APP_PATH"
git pull origin master

# Build sit image
cp $ENV/sitSettings.json $APP_PATH/flask_web/saml/settings.json
cp $ENV/sitNginx.conf $APP_PATH/nginx/nginx.conf
docker build . -t $IMAGE_NAME:$BUILD_TAG-SIT

# Build prod image
cp $ENV/prodSettings.json $APP_PATH/flask_web/saml/settings.json
cp $ENV/prodNginx.conf $APP_PATH/nginx/nginx.conf
docker build . -t $IMAGE_NAME:$BUILD_TAG
