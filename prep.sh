#!/bin/bash

input=/intput
output=/output

for filename in /home/dso/Grading/*;
do
    rm -rf $filename$input
    rm -rf $filename$output
    cp -r "/home/dso/input" $filename;
    cp -r "/home/dso/output" $filename;
done
