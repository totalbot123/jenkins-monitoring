#!/bin/bash

ENV=$HOME/environment
APP_PATH="$HOME/monitoring"

cd "$APP_PATH"

# Build sit image
cp $ENV/sitSettings.json $APP_PATH/flask_web/saml/settings.json
cp $ENV/sitNginx.conf $APP_PATH/nginx/nginx.conf
docker build . -t $JOB_NAME:$BUILD_NUMBER-SIT

# Build prod image
cp $ENV/prodSettings.json $APP_PATH/flask_web/saml/settings.json
cp $ENV/prodNginx.conf $APP_PATH/nginx/nginx.conf
docker build . -t $JOB_NAME:$BUILD_NUMBER
