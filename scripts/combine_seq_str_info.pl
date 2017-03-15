#!/usr/bin/perl -w

	use strict;

	open(FH,"<$ARGV[0]");
	open(GH,"<$ARGV[1]");
	open(OUT,">$ARGV[2]");

	my @seq = <FH>;
	my @str = <GH>;
	chomp(@seq);
	chomp(@str);

	for (my $i = 0; $i <@seq; $i = $i + 2) {
		
		my $seq_header;
		my $str_header;

		if ($seq[$i]=~/^>(.*)/) {
			$seq_header = $1;
		}

		if ($str[$i]=~/^>(.*)/) {
			$str_header = $1;
		}

		if ($seq_header eq $str_header) {
			print OUT ">",$seq_header,"\n";
			print OUT $seq[$i+1],"\n";
			print OUT $str[$i+1],"\n";
		}
	}

	close(FH);
	close(OUT);

	exit 0;
