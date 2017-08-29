#!/bin/bash

readarray -t array < $1;

./extract.sh ${array[3]} ${array[4]}
./backup.sh ${array[5]} ${array[6]} ${array[4]}
./prep.sh ${array[6]} ${array[7]} ${array[8]}

