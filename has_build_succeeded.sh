#!/bin/bash
#
# Determine if the build has succeeded
#
#

has_tower_web=$(docker image list | grep tower-web)
if [[ -n ${has_tower_web} ]]
then
  echo "'tower-web' is found in the Docker image list"
else
  echo "'tower-web' is not found in the Docker image list"
  echo "0"
  exit 0
fi

has_tower_backend=$(docker image list | grep tower-backend)
if [[ -n ${has_tower_backend} ]]
then
  echo "'tower-backend' is found in the Docker image list"
else
  echo "'tower-backend' is not found in the Docker image list"
  echo "0"
  exit 0
fi


echo "1"
exit 1
