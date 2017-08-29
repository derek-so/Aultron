#!/bin/bash
for filename in /home/dso/Downloads/*.zip;
do
    echo $filename
    unzip "$filename" -d /home/dso/Downloads/;
    #mv ${filename%.zip} /home/dso/Downloads/temp/;
    #break;
done

b="/Submission.zip"
for file in /home/dso/Downloads/Submissions/*;
do
    unzip "$file$b" -d $file;
    echo $file$b;
done
