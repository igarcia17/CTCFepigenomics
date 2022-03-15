#!/bin/bash

common_segments=$1
input_file=$2
covered_file=$3

COMMONBASES=$(awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$3-$2 }END{print SUM}' $common_segments)

bedtools intersect -a $common_segments -b $input_file > $covered_file

COVEREDBASES=$(awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$3-$2 }END{print SUM}' $covered_file)

echo $COVEREDBASES
echo $COMMONBASES
