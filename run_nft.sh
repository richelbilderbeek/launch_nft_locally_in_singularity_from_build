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
fi

filename="../nextflow_troubleshooting/scripts/fix_java_error.sh"
if [ ! -f  ${filename} ]
then
  echo "ERROR: script file '${filename}' not found?"
fi

source ${filename}

echo "JAVA_HOME: ${JAVA_HOME}"
echo "JAVA_CMD: ${JAVA_CMD}"

if [ -z ${JAVA_HOME} ]
then
  echo "ERROR:  'JAVA_HOME' not found"
  echo " "
  echo "Tip: run:"
  echo " "
  echo "sudo apt-get install openjdk-19-jdk-headless"
  exit 42
fi

(
  cd nf-tower || exit 2
  make run
)
