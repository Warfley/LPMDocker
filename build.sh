#!/bin/bash

dir=$(basename $1)

echo "Building lpm:${dir}"

docker build --build-arg tag="$dir" -t "lpm:$dir" .
