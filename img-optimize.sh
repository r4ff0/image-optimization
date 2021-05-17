#!/bin/bash

while getopts p: flag
do
    case "${flag}" in
        p) path=${OPTARG};;
    esac
done

if [[ -z "$path" ]]; then
    echo "You must provide path param" 1>&2
    exit 1
fi

find $path -iname "*.jpg" -o -iname "*.jpeg" | while read file; do
  echo "$file"
  magick $file -quality 90 -strip -resize 2050\> $file;
done
