#!/bin/bash

input=/intput
output=/output

for filename in $1*;
do
    rm -rf $filename$input
    rm -rf $filename$output
    cp -r $2 $filename;
    cp -r $3 $filename;
done

sleep 5
