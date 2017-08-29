#!/bin/bash

readarray -t array < $1;

python ../getSubmissions.py ${array[0]} ${array[1]} ${array[2]} ${array[3]}

