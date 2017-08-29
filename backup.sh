#!/bin/bash
newDir=$1;
testDir=$2;

# rm -rf $testDir*;

for filename in $3Submissions/*;
do
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
        cp -r "$filename" "$newDir"
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
