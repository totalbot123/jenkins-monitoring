#!/bin/bash

APP_PATH=/usr/monitoring

docker run --rm -ti $IMAGE_NAME:$BUILD_TAG-SIT pytest tests/ > unit.txt
FAIL=$(cat unit.txt | grep "fail")

cat unit.txt
rm unit.txt
if [[ $FAIL != "" ]]; then
  exit 1
fi

CONTAINER=monitoring

docker run --name=$CONTAINER -p 8000:80 -d $IMAGE_NAME:$BUILD_TAG-SIT

sleep 3

cd $APP_PATH
./integration/integrationTests.sh > integration.txt

cat integration.txt

SUCCESS=$(tail -1 integration.txt)
rm integration.txt
if [[ $SUCCESS != "Successfully passed all tests!" ]]; then
  echo "FAIL!" && exit 1
fi

docker stop $CONTAINER 1>/dev/null && docker rm $CONTAINER 1>/dev/null
