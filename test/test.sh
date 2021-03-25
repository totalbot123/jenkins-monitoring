#!/bin/bash

APP_PATH=$HOME/monitoring

docker run --name=$JOB_NAME --rm -ti $JOB_NAME:$BUILD_NUMBER-SIT pytest tests/ > unit.txt
FAIL=$(cat unit.txt | grep "fail")

cat unit.txt
rm unit.txt
if [[ $FAIL != "" ]]; then
  exit 1
fi

docker run --name=$JOB_NAME -d $JOB_NAME:$BUILD_NUMBER-SIT
docker exec $JOB_NAME bash -c "cd integration && ./integrationTests.sh" >> success.txt
SUCCESS=$(cat success.txt)
rm success.txt
docker stop $JOB_NAME 1>/dev/null && docker rm $JOB_NAME 1>/dev/null

#if [[ $SUCCESS != "Successfully passed all tests!" ]]; then
#  echo "FAIL!" && exit 1
#fi
