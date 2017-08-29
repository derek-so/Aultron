#!/bin/bash

log=/log.txt
input=/input
output=/output

for filename in $1*;
do
    for jar in $filename/*.jar;
    do
        rm $filename$log;
        java -jar $jar $filename$input $filename$output 2> $filename$log;
        if [ -s $filename$log ]
        then
            echo $(basename $filename) >> list.txt
        else
            echo "good"
        fi
        echo $jar;
    done
done
