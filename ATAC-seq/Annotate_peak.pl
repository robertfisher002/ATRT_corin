#!/usr/bin/perl -w
use strict;
use Data::Dumper;



my $file_name1 = $ARGV[0];
my $file_name2 =$ARGV[1];
my $file_name3 =$ARGV[2];
open(FILE, $file_name1);
my %hash1;
while (my $line=<FILE>){

	chomp $line;
        my @ele = split /\t/, $line;
        $hash1{$ele[3]} = $ele[-1];
}
close FILE;
#print Dumper %hash1;
#exit;


#chr1	34513	34992	BT37-CORIN-1_macs2BAMPE_peak_4|17.9237	0	3
#chr1	137287	137783	BT37-CORIN-1_macs2BAMPE_peak_6|4.4686	0	1


open(FILE2, $file_name2) or die;
open(FILE3, ">$file_name3") or die;
while (my $line=<FILE2>) {
	chomp $line;
        my @ele = split (/\t/, $line);
        print FILE3 "$ele[0]\t$ele[1]\t$ele[2]\t$ele[3]\t";
        if ($ele[4] != 0) {
		print FILE3 "TSS\t1\t0\t0\t0\t0\t0\n";
	}
       	elsif ($ele[5] != 0) {
		print FILE3 "GENE\t0\t1\t0\t0\t0\t0\n";
	}
        elsif ($hash1{$ele[3]}< 1000) {
		print FILE3 "<1\t0\t0\t1\t0\t0\t0\n";
	}
        elsif ($hash1{$ele[3]}< 10000) {
		print FILE3 "<10\t0\t0\t0\t1\t0\t0\n";
	}
        elsif ($hash1{$ele[3]}< 100000) {
		print FILE3 "<100\t0\t0\t0\t0\t1\t0\n";
	}
        else {
		print FILE3 ">100\t0\t0\t0\t0\t0\t1\n";
	}
}
close FILE2;
close FILE3;
