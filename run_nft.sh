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

if [ ! -d ../nextflow_troubleshooting ]
then
  echo "ERROR: folder '../nextflow_troubleshooting' not found"
  echo " "
  echo "Tip: Run:"
  echo " "
  echo "  git clone https://github.com/richelbilderbeek/nextflow_troubleshooting .."
  echo " "
fi

../nextflow_troubleshooting/scripts/fix_java_error.sh

(
  cd nf-tower || exit 2
  make run
)
