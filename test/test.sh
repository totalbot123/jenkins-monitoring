#!/bin/bash

APP_PATH=$HOME/monitoring

docker run --name=$JOB_NAME --rm -ti $JOB_NAME:$BUILD_NUMBER-SIT pytest tests/ > unit.txt
FAIL=$(cat unit.txt | grep "fail")

cat unit.txt
rm unit.txt
if [[ $FAIL != "" ]]; then
  exit 1
fi

docker run --name=$JOB_NAME -p 8000:80 -d $JOB_NAME:$BUILD_NUMBER-SIT

sleep 3

cd $APP_PATH
./integration/integrationTests.sh > integration.txt

cat integration.txt

SUCCESS=$(tail -1 integration.txt)
rm integration.txt
if [[ $SUCCESS != "Successfully passed all tests!" ]]; then
  echo "FAIL!" && exit 1
fi

docker stop $JOB_NAME 1>/dev/null && docker rm $JOB_NAME 1>/dev/null
