#!/bin/bash

COMM=$1
INP=$2
NAME=$3

COMMONBASES=$(cat $COMM | awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$3-$2 }END{print SUM}')

echo $COMMONBASES

bedtools intersect -a $COMM -b $INP > $NAME

COVEREDBASES=$(cat $NAME | awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$3-$2 }END{print SUM}')

echo $COVEREDBASES

echo 'The overlapping percentage is'

PERC=$(( $COVEREDBASES * 10000 / $COMMONBASES ))

echo $PERC

echo 'the last two digits are decimals'
#echo 'scale=2; $((COVEREDBASES / COMMONBASES)) ' | bc -1
