#!/bin/bash
#
# Determine if the build has failed
#
has_succeeded=$(bash has_build_succeeded.sh)
if [[ "${has_succeeded}" -eq "0" ]]
then
  echo "1"
  exit 1
else
  echo "0"
  exit 0
fi
