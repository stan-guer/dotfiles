#!/bin/bash

STATUS="running exited paused dead"

for stat in $STATUS; do
    prefix=${stat:0:1}
    output="$output $prefix $(docker ps -qf status="$stat" | wc -l) |"
done

echo "dockr |$output"
