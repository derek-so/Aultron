#!/bin/bash

readarray -t array < $1;

echo "downloading"
# python getSubmissions.py ${array[0]} ${array[1]} ${array[2]} ${array[3]}
echo "finished?"

./extract.sh ${array[3]} ${array[4]}
./backup.sh ${array[5]} ${array[6]} ${array[4]}
./prep.sh ${array[6]} ${array[7]} ${array[8]}
./compile.sh ${array[6]}
