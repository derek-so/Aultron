#!/bin/bash

readarray -t array < $1;

#python getSubmissions.py ${array[0]} ${array[1]} ${array[2]} ${array[3]}

# ./extract.sh ${array[3]} ${array[4]}

./backup.sh ${array[5]} ${array[6]} ${array[4]}
