#!/bin/bash

dir=$(basename $1)
prefix=""
if [ -n "$2" ]
then
  prefix="$2/"
fi

echo "Building lpm:${dir}"

docker build --build-arg tag="$dir" -t "${prefix}lpm:$dir" .
