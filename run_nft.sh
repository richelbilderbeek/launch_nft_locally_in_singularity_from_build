#!/bin/bash
#
# Run the NFT
#
# Usage:
#
#   ./run_nft.sh
#

if [ ! -d nf-tower ]
then
  echo "ERROR: folder 'nf-tower' not found"
  echo " "
  echo "Tip: Run:"
  echo " "
  echo "  ./clone_repo.sh"
  echo " "
  exit 42
fi

folder_name="../nextflow_troubleshooting"
if [ ! -d  ${folder_name} ]
then
  echo "ERROR: folder '${folder_name}' not found"
  echo " "
  echo "Tip: Run:"
  echo " "
  echo "  git clone https://github.com/richelbilderbeek/nextflow_troubleshooting .."
  echo " "
  exit 42
fi

filename="../nextflow_troubleshooting/scripts/fix_java_error.sh"
if [ ! -f  ${filename} ]
then
  echo "ERROR: script file '${filename}' not found?"
  exit 42
fi

# shellcheck source=../nextflow_troubleshooting/scripts/fix_java_error.sh
source "${filename}"

echo "JAVA_HOME: ${JAVA_HOME}"
echo "JAVA_CMD: ${JAVA_CMD}"

if [ -z "${JAVA_HOME}" ]
then
  echo "ERROR:  'JAVA_HOME' not found"
  echo " "
  echo "Tip: run:"
  echo " "
  echo "sudo apt-get install openjdk-19-jdk-headless"
  exit 42
fi


folder_name="../launch_nft_locally_in_singularity_from_dockerfile"
if [ ! -d  ${folder_name} ]
then
  echo "ERROR: folder '${folder_name}' not found"
  echo " "
  echo "Tip: Run:"
  echo " "
  echo "  git clone https://github.com/richelbilderbeek/launch_nft_locally_in_singularity_from_dockerfile .."
  echo " "
  exit 42
fi

filename="../launch_nft_locally_in_singularity_from_dockerfile/is_ssh_server_running.sh"
if [ ! -f  ${filename} ]
then
  echo "ERROR: script file '${filename}' not found?"
fi


filename="tower.yml"
target_path="nf-tower/tower-backend/${filename}"
if [ ! -f  ${target_path} ]
then
  cp "${filename}" "${target_path}"
else
  echo "Configuration file '${filename}' already present at ${target_path}"
fi

if [ ! -f  ${target_path} ]
then
  echo "ERROR: configuration file '${filename}' still not found at ${target_path} ...?"
  exit 42
fi

is_running=$(bash "${filename}")
if [[ "${is_running}" -eq "0" ]]
then
  echo "ERROR: ssh server is not running"
  echo " "
  echo "Tip: run:"
  echo " "
  echo "sudo apt install openssh-server"
  exit 42
fi


(
  cd nf-tower || exit 2
  make run
)
