#!/bin/bash

set -e

for tag in $(find . -maxdepth 1 -mindepth 1 -type d)
do
    if [ -f "${tag}/build.sh" ]
    then
      ./build.sh $tag $1
    fi
done
