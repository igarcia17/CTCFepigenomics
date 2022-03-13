#!/bin/bash
# Used within the summaryBiologicalInterpretation.ipynb

perc_overlap=$1

bedtools intersect -a my_results/common_segments.bed -b input/CD14_monocytesDukeDNaseSeq.pk -c -f $perc_overlap > my_results/covered_DNAsepeaks_count$perc_overlap.bed

cat my_results/covered_DNAsepeaks_count$perc_overlap.bed | awk -F'\t' 'BEGIN{SUM=0}{ SUM+=$5 }END{print SUM}'
