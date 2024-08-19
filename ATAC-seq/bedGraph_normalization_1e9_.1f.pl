#!/usr/bin/perl -w

#=============================================================================#
#Program: bedGraph_normalization_1e9.pl
#Author: Samuel Beck
#Date: 05312013
#Usage: [script].pl [filled bedgraph]
#Description: Normalize bedgraph into total tag count 1e9
#=============================================================================#
use strict;

open(FILE, $ARGV[0]);
my $total = 0;
while (<FILE>) 
	{
	my $line = $_; chomp $line;
	if ($line =~ /^chr/) 
		{
		my @element = split /\t/, $line;
		my $tag = ($element[2]-$element[1])*$element[3];
		$total = $total + $tag;
		}
	}
close FILE;

open(FILE, $ARGV[0]);
open(OUT, ">normalized_1e9_$ARGV[0]") or die;
while (<FILE>) 
	{
	my $line = $_; chomp $line;
	if ($line =~ /^chr/) 
		{
		my @element = split /\t/, $line;
		if ($element[3] == 0) {print OUT "$line\n";}
		else 
			{
			my $newval = $element[3] * 1000000000 / $total;
			my $newval2 = sprintf("%.1f", $newval);
			print OUT "$element[0]\t$element[1]\t$element[2]\t$newval2\n";
			}
		}
	else {print OUT "$line\n";}
	}


