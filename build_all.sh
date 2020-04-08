#!/bin/bash

function findTags() {
    for tag in $(find . -maxdepth 1 -mindepth 1 -type d)
    do
        if [ -f "${tag}/build.sh" ]
        then
            echo $(basename $tag)
        fi
    done
}

findTags | parallel './build.sh {} > build_{}.log 2>&1'
