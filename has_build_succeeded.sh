#!/bin/bash
#
# Determine if the build has succeeded
#
# Usage:
#
#   ./has_build_succeeded
#   ./has_build_succeeded --verbose
#

has_tower_web=$(docker image list | grep tower-web)
verbose=$(("$#" != 0))


if [[ -n ${has_tower_web} ]]
then

  if [ "${verbose}" -eq 1 ]
  then
    echo "'tower-web' is found in the Docker image list"
  fi
else
  if [ "${verbose}" -eq 1 ]
  then
    echo "'tower-web' is not found in the Docker image list"
  fi
  echo "0"
  exit 0
fi

has_tower_backend=$(docker image list | grep tower-backend)
if [[ -n ${has_tower_backend} ]]
then
  if [ "${verbose}" -eq 1 ]
  then
    echo "'tower-backend' is found in the Docker image list"
  fi
else
  if [ "${verbose}" -eq 1 ]
  then
    echo "'tower-backend' is not found in the Docker image list"
  fi
  echo "0"
  exit 0
fi


echo "1"
exit 1
