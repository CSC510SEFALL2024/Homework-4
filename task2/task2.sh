#!/bin/bash

cd dataset1 || exit 1

grep -l "sample" file_* | while read filename; do
  count=$(grep -o "CSC510" "$filename" | wc -l)
  if [ "$count" -ge 3 ]; then
    size=$(ls -l "$filename" | awk '{print $5}')
    echo "$count $size $filename"
  fi
done | \
sort -k1,1nr -k2,2nr | \
sed 's/file_/filtered_/g' | \
awk '{print $3}'
