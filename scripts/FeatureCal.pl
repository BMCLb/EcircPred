#!/usr/bin/perl -w
	use strict;
	use Functions;

	open(FH,"<$ARGV[0]");
	my @arr = <FH>;
	chomp(@arr);

	open(GH,"$ARGV[1]");
	my @kmer2_entry = <GH>;
	chomp(@kmer2_entry);

	open(RH,"<$ARGV[2]");
	my @freq_arr = <RH>;
	chomp(@freq_arr);
	open(PH,"<$ARGV[3]");
	my @dintProp = <PH>;
	chomp(@dintProp);

	open(CH,"<$ARGV[4]");
	my @arr_emp = <CH>;
	chomp(@arr_emp);
	
	print "Calculating features\n";
	
	Functions::StatDinucleotideIndex(\@arr,\@kmer2_entry);
	Functions::EntropyDiNucleotide(\@freq_arr,\@dintProp);
	Functions::EmissionProb(\@arr_emp);
	

	close(FH);
	close(GH);
	exit 0;
