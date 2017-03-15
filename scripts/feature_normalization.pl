#!/usr/bin/perl -w
	use strict;

	open(FH,"<$ARGV[0]"); # all column means
	my $line;

	my @all_col_means = <FH>;
	chomp(@all_col_means);

	open(GH,"<$ARGV[1]"); # without normalized features
	my $line2;

	open(OUT,">$ARGV[2]"); # normalized features

	while ($line2=<GH>) {
		chomp($line2);
		my @arr = split("\t",$line2);
		my @nor_arr = ();
	
		for (my $i = 0; $i <@arr; $i++) {
			$nor_arr[$i] = $arr[$i] - $all_col_means[$i];	
		}
		
		print OUT join("\t",@nor_arr),"\n";
	}

	exit 0;
