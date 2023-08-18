#!/bin/bash

if [ ! -d nf-tower ]
then
  echo "ERROR: folder 'nf-tower' not found"
  echo " "
  echo "Tip: Run:"
  echo " "
  echo "  ./1_clone_repo.sh"
  echo " "
fi

(
  cd nf-tower || exit 2
  make run
)
