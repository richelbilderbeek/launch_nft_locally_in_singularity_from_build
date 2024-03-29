#!/bin/bash
#
# Creates two Singularity containers for NFT.
#
# Usage:
#
#   ./create_singularity_containers.sh
#
set -x

docker_image_name="nf-tower_backend:1.29.2"
singularity_filename="backend/nf-tower_backend-latest.sif"

if [[ -f ${singularity_filename} ]]
then
  echo "Singularity image file '${singularity_filename}' already present."
else
  echo "Singularity image file '${singularity_filename}' absent. Pulling it now."
  # singularity pull --dir backend "docker://${docker_image_name}"
  SINGULARITY_NOHTTPS=1 singularity build ${singularity_filename} "docker-daemon://${docker_image_name}"

  # Confirm it works
  if [[ -f ${singularity_filename} ]]
  then
    echo "Success: Singularity image file '${singularity_filename}' is now present."
  else
    echo "ERROR: Singularity image file '${singularity_filename}' is still absent...?"
  fi
fi

echo "EOFUGBPWEFUBEP("
exit 42

docker_image_name="nf-tower_frontend"
singularity_filename="frontend/nf-tower_web-latest.sif"

if [[ -f ${singularity_filename} ]]
then
  echo "Singularity image file '${singularity_filename}' already present."
else
  echo "Singularity image file '${singularity_filename}' absent. Pulling it now."
  singularity pull --dir frontend "docker://${docker_image_name}"

  # Confirm it works
  if [[ -f ${singularity_filename} ]]
  then
    echo "Success: Singularity image file '${singularity_filename}' is now present."
  else
    echo "ERROR: Singularity image file '${singularity_filename}' is still absent...?"
  fi
fi
