#!/usr/bin/perl -w

#=============================================================================#
#=============================================================================#
use strict;
use POSIX;
use Parallel::ForkManager;

my @values = (1, 2, 5);

use List::Util qw(shuffle); 
my @signalfiles = shuffle(glob ("*.10ksig"));

my $pm = new Parallel::ForkManager(19);



foreach my $file (shuffle @signalfiles)
	{
	my $pid = $pm->start and next; # Forks and returns the pid for the child:
	open (OUT, ">\_$file.ggplot2.r");
	print OUT 'all <- ("'."$file".'")'."\n";
	print OUT 'temp <- as.matrix(read.delim(all,header=TRUE,sep="\t",row.names=1,as.is=TRUE))'."\n";
	print OUT 'library(reshape2)'."\n";
	print OUT 'melted_temp <- melt(temp)'."\n";
	print OUT 'library(ggplot2)'."\n";
	print OUT 'library(scales)'."\n";
	print OUT 'library(cowplot)'."\n";
	foreach my $val (@values)
		{
		print OUT 'png(file="'."_$file\.0"."to$val".'.x0.1height.png",width=800,height=NROW(temp)*0.1)'."\n";
		print OUT "ggplot\(melted_temp, aes\(x\=Var2, y\=Var1, fill\=value\)\) \+ geom_tile\(\) + scale_fill_gradient2\(low \= \'white\', high = \'red\', na.value \= \'white\', oob\=squish, limit \= c\(0,$val\)\) \+ theme_nothing\(\)\n";
		print OUT "dev.off\(\)\n";
		}
#	foreach my $val (@values)
#		{
#		print OUT 'png(file="'."_$file\.0"."to$val".'.x1height.png",width=800,height=NROW(temp))'."\n";
#		print OUT "ggplot\(melted_temp, aes\(x\=Var2, y\=Var1, fill\=value\)\) \+ geom_tile\(\) + scale_fill_gradient2\(low \= \'white\', high = \'red\', na.value \= \'white\', oob\=squish, limit \= c\(0,$val\)\) \+ theme_nothing\(\)\n";
#		print OUT "dev.off\(\)\n";
#		}
	close OUT;
	system "Rscript _$file.ggplot2.r";
	foreach my $val (@values)
		{
#		system "convert _$file\.0"."to$val\.x1height.png -flip _$file\.0"."to$val\.x1height.png ";
		system "convert _$file\.0"."to$val\.x0.1height.png -flip _$file\.0"."to$val\.x0.1height.png ";
		}
	$pm->finish; # Terminates the child process
	}
$pm->wait_all_children();
