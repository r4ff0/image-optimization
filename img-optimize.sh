#!/bin/bash

for d in $(find ./uploads/ -maxdepth 2 -type d)
do
	echo $d
 	for file in $d/*.jpeg; 
	do 
		if [ -f "$file" ]; then
			#echo $file
			magick $file -quality 90% -strip -resize 2050\> $file;
		fi 
	done	
done
