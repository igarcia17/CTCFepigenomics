#!/bin/bash
# Used within the summaryBiologicalInterpretation.ipynb

perc_overlap=$1
input_file=$2

bedtools intersect -a my_results/common_segments.bed -b $input_file -c -f $perc_overlap > ${input_file}_eval.bed

cat ${input_file}_eval.bed | awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$5 }END{print SUM}'
