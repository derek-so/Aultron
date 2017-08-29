#!/bin/bash
for filename in $1*.zip;
do
    echo $filename
    unzip "$filename" -d $2;
    #mv ${filename%.zip} /home/dso/Downloads/temp/;
    #break;
done

b="/Submission.zip"
for file in $2/Submissions/*;
do
    unzip "$file$b" -d $file;
    echo $file$b;
done

sleep 5
