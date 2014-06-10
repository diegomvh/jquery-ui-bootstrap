#!/usr/bin/env bash

for source in $(find less); do
    directory=${source/less/sass}
    directory=`dirname $directory`
    mkdir -p $directory
    if [[ $source =~ \.less$ ]]
    then 
        destiny=${source%%.less}
        destiny=${destiny/less/sass}.scss
        ./converter "$source" "$destiny"
    else 
        cp "$source" "$destiny"
    fi
done
