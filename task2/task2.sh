#!/bin/bash

cd dataset1 || exit 1

# Pipeline to list, filter, sort, and rename files
grep -l "sample" file_* | \
xargs -I {} bash -c 'echo $(grep -o "CSC510" "{}" | wc -l) $(stat -c%s "{}") {}' | \
awk '$1 >= 3' | \
sort -k1,1nr -k2,2nr | \
awk '{gsub("file_", "filtered_", $3); print $3}'
