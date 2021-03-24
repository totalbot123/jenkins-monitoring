#!/bin/bash

APP_PATH=$HOME/monitoring

docker run --name=$JOB_NAME --rm -ti $JOB_NAME:$BUILD_NUMBER-SIT pytest tests/ > unit.txt
FAIL=$(cat unit.txt | grep "fail")

cat unit.txt
rm unit.txt
if [[ $FAIL != "" ]]; then
  exit 1
fi

cd $APP_PATH/integration
SUCCESS=$(docker run --rm $JOB_NAME:$BUILD_NUMBER-SIT bash -c "./integration/integrationTests.sh")

if [[ $SUCCESS != "Successfully passed all tests!" ]]; then
  echo "FAIL!" && exit 1
fi
