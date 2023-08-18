#!/bin/bash
#
# Build the NFT
#
# Usage:
#
#   ./build_nft.sh
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

(
  cd nf-tower || exit 2
  make build
)
