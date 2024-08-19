#!/bin/bash


FILES=("_BT37-1_conly" "_BT37-1_dcoverlap" "_BT37-1_donly" "_BT37-2_conly" "_BT37-2_dcoverlap" "_BT37-2_donly" "_CHLA06-1_conly" "_CHLA06-1_dcoverlap" "_CHLA06-1_donly" "_CHLA06-2_conly" "_CHLA06-2_dcoverlap" "_CHLA06-2_donly")
for File_name in "${FILES[@]}"; do

	#File_name=$1
	cat $File_name |awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "|" $9}' > $File_name.bed
	intersectBed -a $File_name.bed -b hg38_TSS.bed -c > $File_name.tss
	intersectBed -a $File_name.tss -b hg38_Gene.bed -c > $File_name.gene
	sort -k1,1 -k2,2n $File_name.gene > $File_name.gene.sort
	closestBed -a $File_name.gene.sort -b hg38_TSS.bed -d >$File_name.02.tss
	perl Annotate_peak.pl $File_name.02.tss $File_name.gene $File_name.res
	echo $File_name
	sh New_Count_percentage.sh $File_name.res 5
done

