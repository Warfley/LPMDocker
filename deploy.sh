#!/bin/bash

set -e

prefix=""
if [ -n "$1" ]
then
  prefix="$1/"
else
  echo "Error: No prefix gives"
  exit
fi

for tag in $(find . -maxdepth 1 -mindepth 1 -type d)
do
    if [ -f "${tag}/build.sh" ]
    then
      ./docker push "${prefix}lpm:$tag"
    fi
done
