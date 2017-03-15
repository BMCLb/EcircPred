#!/usr/bin/perl -w
	use strict;

	#AA 	AC	AG	AT	CA	CC	CG	CT	GA	GC	GG	GT	TA	TC	TG	TT 

	open (FH,"<$ARGV[0]");
	open(OUT,">$ARGV[1]");

	my $line;

	while ($line=<FH>) {
		chomp($line);
		
		if ($line=~/^>(.*)/) {
			print OUT $1,"\t";
			$line=<FH>;
			chomp($line);
			my $val = &freq_cal($line);
			print OUT $val,"\n";
			
		}
	}

	exit 0;

sub freq_cal {

	my $input = $_[0];
	my $countAA = 0;	
	my $countAC = 0;
	my $countAG = 0;
	my $countAT = 0;
	my $countCA = 0;	
	my $countCC = 0;
	my $countCG = 0;
	my $countCT = 0;
	my $countGA = 0;	
	my $countGC = 0;
	my $countGG = 0;
	my $countGT = 0;
	my $countTA = 0;	
	my $countTC = 0;
	my $countTG = 0;
	my $countTT = 0;
	my $n = length($input);

	for (my $i = 0; $i < $n - 1; $i++) {
		my $dint = substr($input,$i,2);

		if ($dint eq 'AA') {
			$countAA++;
		} 
	
		if ($dint eq 'AC') {
			$countAC++;
		}
		
		if ($dint eq 'AG') {
			$countAG++;
		}

		if ($dint eq 'AT') {
			$countAT++;
		}

		if ($dint eq 'CA') {
			$countCA++;
		}

		if ($dint eq 'CC') {
			$countCC++;
		}

		if ($dint eq 'CG') {
			$countCG++;
		}

		if ($dint eq 'CT') {
			$countCT++;
		}

		if ($dint eq 'GA') {
			$countGA++;
		}

		if ($dint eq 'GC') {
			$countGC++;
		}

		if ($dint eq 'GG') {
			$countGG++;
		}

		if ($dint eq 'GT') {
			$countGT++;
		}

		if ($dint eq 'TA') {
			$countTA++;
		}

		if ($dint eq 'TC') {
			$countTC++;
		}

		if ($dint eq 'TG') {
			$countTG++;
		}

		if ($dint eq 'TT') {
			$countTT++;
		}
	}

	my @arr_val = ($countAA/$n,$countAC/$n,$countAG/$n,$countAT/$n,$countCA/$n,$countCC/$n,$countCG/$n,$countCT/$n,$countGA/$n,$countGC/$n,$countGG/$n,$countGT/$n,$countTA/$n,$countTC/$n,$countTG/$n,$countTG/$n);
	my $ret_line = join("\t",@arr_val);
	return($ret_line);
}
