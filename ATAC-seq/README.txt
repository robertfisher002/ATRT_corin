#1. Alignment, Peak calling, Graph generation: 
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 BT37-CORIN-1_R1_001.fastq -2 BT37-CORIN-1_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o BT37-CORIN-1.sort.bam;samtools rmdup BT37-CORIN-1.sort.bam BT37-CORIN-1.sort.rmdup.bam; macs2 callpeak -t BT37-CORIN-1.sort.bam -n BT37-CORIN-1.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t BT37-CORIN-1.sort.rmdup.bam -n BT37-CORIN-1.sort.rmdup.BAMPE -g hs -f BAMPE -B;
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 BT37-CORIN-2_R1_001.fastq -2 BT37-CORIN-2_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o BT37-CORIN-2.sort.bam;samtools rmdup BT37-CORIN-2.sort.bam BT37-CORIN-2.sort.rmdup.bam; macs2 callpeak -t BT37-CORIN-2.sort.bam -n BT37-CORIN-2.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t BT37-CORIN-2.sort.rmdup.bam -n BT37-CORIN-2.sort.rmdup.BAMPE -g hs -f BAMPE -B;
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 BT37-DMSO-1_R1_001.fastq -2 BT37-DMSO-1_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o BT37-DMSO-1.sort.bam;samtools rmdup BT37-DMSO-1.sort.bam BT37-DMSO-1.sort.rmdup.bam; macs2 callpeak -t BT37-DMSO-1.sort.bam -n BT37-DMSO-1.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t BT37-DMSO-1.sort.rmdup.bam -n BT37-DMSO-1.sort.rmdup.BAMPE -g hs -f BAMPE -B;
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 BT37-DMSO-2_R1_001.fastq -2 BT37-DMSO-2_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o BT37-DMSO-2.sort.bam;samtools rmdup BT37-DMSO-2.sort.bam BT37-DMSO-2.sort.rmdup.bam; macs2 callpeak -t BT37-DMSO-2.sort.bam -n BT37-DMSO-2.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t BT37-DMSO-2.sort.rmdup.bam -n BT37-DMSO-2.sort.rmdup.BAMPE -g hs -f BAMPE -B;
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 CHLA06-CORIN-1_R1_001.fastq -2 CHLA06-CORIN-1_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o CHLA06-CORIN-1.sort.bam;samtools rmdup CHLA06-CORIN-1.sort.bam CHLA06-CORIN-1.sort.rmdup.bam; macs2 callpeak -t CHLA06-CORIN-1.sort.bam -n CHLA06-CORIN-1.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t CHLA06-CORIN-1.sort.rmdup.bam -n CHLA06-CORIN-1.sort.rmdup.BAMPE -g hs -f BAMPE -B;
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 CHLA06-CORIN-2_R1_001.fastq -2 CHLA06-CORIN-2_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o CHLA06-CORIN-2.sort.bam;samtools rmdup CHLA06-CORIN-2.sort.bam CHLA06-CORIN-2.sort.rmdup.bam; macs2 callpeak -t CHLA06-CORIN-2.sort.bam -n CHLA06-CORIN-2.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t CHLA06-CORIN-2.sort.rmdup.bam -n CHLA06-CORIN-2.sort.rmdup.BAMPE -g hs -f BAMPE -B;
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 CHLA06-DMSO-1_R1_001.fastq -2 CHLA06-DMSO-1_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o CHLA06-DMSO-1.sort.bam;samtools rmdup CHLA06-DMSO-1.sort.bam CHLA06-DMSO-1.sort.rmdup.bam; macs2 callpeak -t CHLA06-DMSO-1.sort.bam -n CHLA06-DMSO-1.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t CHLA06-DMSO-1.sort.rmdup.bam -n CHLA06-DMSO-1.sort.rmdup.BAMPE -g hs -f BAMPE -B;
bowtie2 -p 40 -x /disk2/___genome.files/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome -1 CHLA06-DMSO-2_R1_001.fastq -2 CHLA06-DMSO-2_R2_001.fastq | samtools view -bS | samtools sort -@ 40 -o CHLA06-DMSO-2.sort.bam;samtools rmdup CHLA06-DMSO-2.sort.bam CHLA06-DMSO-2.sort.rmdup.bam; macs2 callpeak -t CHLA06-DMSO-2.sort.bam -n CHLA06-DMSO-2.sort.BAMPE -g hs -f BAMPE -B;macs2 callpeak -t CHLA06-DMSO-2.sort.rmdup.bam -n CHLA06-DMSO-2.sort.rmdup.BAMPE -g hs -f BAMPE -B;

#2. peak classification (BedTools)
## 2.1 Unique peaks (i.e., corin only or DMSO only)
intersectBed -a [Peak file 1] -b [Peak file 2] -v > [outputfile (unique peaks in peak file 1)];
## 2.2 Overlapping peaks (i.e., overlaps between corin and DMSO)
intersectBed -a [Peak file 1] -b [Peak file 2] -u > [outputfile (peak file 1 & 2 overlapping regions)];

#3. bedgraph normalization (bedGraph_normalization_1e9_.1f.pl)
perl bedGraph_normalization_1e9_.1f.pl [bedgraph file];

#4. obtain +/- 5Kb signals (Homer)
annotatePeaks.pl [peak file] mm10 -size 10000 -bedGraph [bedgraph file] -hist 25 -ghist > [output file];

#5. heatmap generation (maketableNheatmapR_usingggplots2_pixelewmatrixsize_autoflip_yesglob.pl)
perl maketableNheatmapR_usingggplots2_pixelewmatrixsize_autoflip_yesglob.pl;

#6. Annotation of the peaks (run the shell script) it will use two other scripts Annotate_peak.pl and New_Count_percentage.sh
Annotation_script.sh
