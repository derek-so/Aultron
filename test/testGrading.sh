#!/bin/bash

readarray -t array < $1

./compile.sh ${array[6]}
