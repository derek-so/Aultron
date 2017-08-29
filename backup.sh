#!/bin/bash
newDir=$1;
testDir=$2;

rm -rf $testDir*;

for filename in $3/Submissions/*;
do
    echo $filename;
    if [ -d "$newDir$(basename $filename)" ];
    then
        diff -rw $newDir$(basename $filename) $filename;
        if [ $? -eq 1 ]
        then
            echo "they are different"
            rm -rf $newDir$(basename $filename);
            cp -r "$filename" "$newDir"
            cp -r "$filename" "$testDir"
        fi
    else
        echo extracting $filename to $newDir
        cp -r "$filename" "$newDir"
        echo extracting $filename to $testDir
        cp -r "$filename" "$testDir"
    fi
done
for file in $2*;
do
    echo $file;
    if [ "$(ls -A $file)" ];
    then
        echo "full"
    else
        rmdir "$file"
    fi
done

sleep 5
