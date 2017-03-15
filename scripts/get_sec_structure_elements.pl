#!/usr/bin/perl -w
	use strict;

	open(FH,"<$ARGV[0]");
	open(OUT,">$ARGV[1]");
	
	
	my $line;

	while ($line=<FH>) {
		chomp($line);
		print OUT $line,"\n";
		my @secstr = ();
		my $line_paired=<FH>;
		chomp($line_paired);
		my @arr_paired = split(" ",$line_paired);
		
		my $line_hairpin_loop=<FH>;
		chomp($line_hairpin_loop);
		my @arr_hairpin_loop = split(" ",$line_hairpin_loop);

		my $line_internal_loop=<FH>;
		chomp($line_internal_loop);
		my @arr_internal_loop = split(" ",$line_internal_loop);

		my $line_multiloop=<FH>;
		chomp($line_multiloop);
		my @arr_multiloop = split(" ",$line_multiloop);

		my $line_external_region=<FH>;
		chomp($line_external_region);
		my @arr_external_region = split(" ",$line_external_region);
		my @str = ('P','H','I','M','E');

		for (my $i = 0; $i <@arr_paired; $i++) {
			my @prob_val = ($arr_paired[$i],$arr_hairpin_loop[$i],$arr_internal_loop[$i],$arr_multiloop[$i],$arr_external_region[$i]);
			
			my $max_index;
			my $max = $prob_val[0];

			for (my $j = 0; $j < @prob_val; $j++) {
				
				if ($prob_val[$j] >= $max ) {
					$max = $prob_val[$j];
					$max_index = $j;
				}
			}

			push(@secstr,$str[$max_index]);
		}
		print OUT join("",@secstr),"\n";
	}

	exit 0;
