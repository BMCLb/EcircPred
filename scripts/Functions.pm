package Functions;
	use strict;

sub EmissionProb {
	my @input = @{$_[0]};
	
	open(OUT3,">emission_prob_feature.txt");
	my $line;

	my $countAP;
	my $countTP;
	my $countGP;
	my $countCP;
	my $countAH;
	my $countTH;
	my $countGH;
	my $countCH;
	my $countAI;
	my $countTI;
	my $countGI;
	my $countCI;
	my $countAM;
	my $countTM;
	my $countGM;
	my $countCM;
	my $countAE;
	my $countTE;
	my $countGE;
	my $countCE;
	my $countP;
	my $countH;
	my $countI;
	my $countM;
	my $countE;

	for (my $i = 0; $i <@input; $i = $i+3) {
		my $id;
		my $seq;
		my $state;

		if ($input[$i]=~/^>(\w+)/) {
			$id = $1;
			$line=$input[$i+1];
			$seq=$line;
			$line=$input[$i+2];
			$state=$line;
		}

		$countP=0;
		$countH=0;
		$countI=0;
		$countM=0;
		$countE=0;

		$countAP=0;
		$countTP=0;
		$countGP=0;
		$countCP=0;

		$countAH=0;
		$countTH=0;
		$countGH=0;
		$countCH=0;

		$countAI=0;
		$countTI=0;
		$countGI=0;
		$countCI=0;

		$countAM=0;
		$countTM=0;
		$countGM=0;
		$countCM=0;

		$countAE=0;
		$countTE=0;
		$countGE=0;
		$countCE=0;

		for ( my $i = 0; $i <length($seq); $i++) {
			my $nt = substr($seq,$i,1);
			my $hs = substr($state,$i,1);

			if ($hs eq 'P') {
				$countP++;
			} elsif ($hs eq 'H') {
				$countH++;
			} elsif ($hs eq 'I') {
				$countI++;
			}elsif ($hs eq 'M') {
				$countM++;
			}elsif ($hs eq 'E') {
				$countE++;
			}


			if (($hs eq 'P') && ($nt eq 'A')) {
				$countAP++;
			} elsif (($hs eq 'P') && ($nt eq 'T')) {
				$countTP++;
			}elsif (($hs eq 'P') && ($nt eq 'G')) {
				$countGP++;
			}elsif (($hs eq 'P') && ($nt eq 'C')) {
				$countCP++;
			}elsif (($hs eq 'H') && ($nt eq 'A')) {
				$countAH++;
			}elsif (($hs eq 'H') && ($nt eq 'T')) {
				$countTH++;
			}elsif (($hs eq 'H') && ($nt eq 'G')) {
				$countGH++;
			}elsif (($hs eq 'H') && ($nt eq 'C')) {
				$countCH++;
			}elsif (($hs eq 'I') && ($nt eq 'A')) {
				$countAI++;
			}elsif (($hs eq 'I') && ($nt eq 'T')) {
				$countTI++;
			}elsif (($hs eq 'I') && ($nt eq 'G')) {
				$countGI++;
			}elsif (($hs eq 'I') && ($nt eq 'C')) {
				$countCI++;
			}elsif (($hs eq 'M') && ($nt eq 'A')) {
				$countAM++;
			}elsif (($hs eq 'M') && ($nt eq 'T')) {
				$countTM++;
			}elsif (($hs eq 'M') && ($nt eq 'G')) {
				$countGM++;
			}elsif (($hs eq 'M') && ($nt eq 'C')) {
				$countCM++;
			}elsif (($hs eq 'E') && ($nt eq 'A')) {
				$countAE++;
			}elsif (($hs eq 'E') && ($nt eq 'T')) {
				$countTE++;
			}elsif (($hs eq 'E') && ($nt eq 'G')) {
				$countGE++;
			}elsif (($hs eq 'E') && ($nt eq 'C')) {
				$countCE++;
			}
		}
		
		if ($countP != 0) {
			$countAP=$countAP/($countP * length($seq));
			$countTP=$countTP/($countP * length($seq));
			$countGP=$countGP/($countP * length($seq));
			$countCP=$countCP/($countP * length($seq));
		} else {
			$countAP=0;
			$countTP=0;
			$countGP=0;
			$countCP=0;
		}
		
		if ($countH != 0) {
			$countAH=$countAH/($countH * length($seq));
			$countTH=$countTH/($countH * length($seq));
			$countGH=$countGH/($countH * length($seq));
			$countCH=$countCH/($countH * length($seq));
		} else {
			$countAH=0;
			$countTH=0;
			$countGH=0;
			$countCH=0;
		}

		if ($countI != 0) {
			$countAI=$countAI/($countI * length($seq));
			$countTI=$countTI/($countI * length($seq));
			$countGI=$countGI/($countI * length($seq));
			$countCI=$countCI/($countI * length($seq));
		} else {
			$countAI=0;
			$countTI=0;
			$countGI=0;
			$countCI=0;
		}
		
		if ($countM != 0) {
			$countAM=$countAM/($countM * length($seq));
			$countTM=$countTM/($countM * length($seq));
			$countGM=$countGM/($countM * length($seq));
			$countCM=$countCM/($countM * length($seq));
		} else {
			$countAM=0;
			$countTM=0;
			$countGM=0;
			$countCM=0;
		}
		
		if ($countE != 0) {
			$countAE=$countAE/($countE * length($seq));
			$countTE=$countTE/($countE * length($seq));
			$countGE=$countGE/($countE * length($seq));
			$countCE=$countCE/($countE * length($seq));
		} else {
			$countAE=0;
			$countTE=0;
			$countGE=0;
			$countCE=0;
		}
		
		print OUT3 $countAP,"\t",$countTP,"\t",$countGP,"\t",$countCP,"\t",$countAH,"\t",$countTH,"\t",$countGH,"\t",$countCH,"\t",$countAI,"\t",$countTI,"\t",$countGI,"\t",$countCI,"\t",$countAM,"\t",$countTM,"\t",$countGM,"\t",$countCM,"\t",$countAE,"\t",$countTE,"\t",$countGE,"\t",$countCE,"\n";

	}
	
	close(OUT3);
}

sub EntropyDiNucleotide {
	my @norfreq = @{$_[0]};
	my @dintprop = @{$_[1]};

	open(OUT2,">rna_entropy_feature.txt");
	my $val_line = $dintprop[1];
	my @prop_arr = split("\t",$val_line);

	for (my $j = 0; $j <@norfreq; $j++) {
		my @arr2 = split("\t",$norfreq[$j]);
		my $id = shift(@arr2);
		my @wtarr = ();

		for (my $i = 0; $i < @arr2; $i++) {
			my $weighted_val = $prop_arr[$i] * $arr2[$i];
			push(@wtarr,$weighted_val);	
		}
		
		print OUT2 join("\t",@wtarr),"\n";
	}
}

sub StatDinucleotideIndex {
	open(OUT1,">dint_index_feature.txt");
	my @input = @{$_[0]};
	my @kmer_inst = @{$_[1]};
	
	for (my $i = 0; $i <@input; $i = $i+2) {
		my $id;
	
		if ($input[$i]=~/^>(.*)/) {
			$id = $1;
			
			my $ref_monomer_mn_sd = &IndexMnSd($input[$i+1],\@kmer_inst);
			my @mean_sd_mono = @{$ref_monomer_mn_sd};
			my $monomer_vector = join("\t",@mean_sd_mono);
			print OUT1 $monomer_vector,"\t";
		}	

		print OUT1 "\n";
	}

	close(OUT1);
}

sub IndexMnSd {
	my $input_seq = $_[0];
	my @kmer = @{$_[1]};
	my @mn_ds_arr = ();
	my $len = length($input_seq);
	

	for (my $i = 0; $i < @kmer; $i++) {
		my @count_arr = ();
		my $count_index = 0;

		while (($count_index = index($input_seq,$kmer[$i],$count_index)) >= 0) {
			push(@count_arr,$count_index);
			$count_index++;
		}

		if (scalar(@count_arr) > 0) {
			my $mean_val = &Mean(\@count_arr);
			my $sd_val = &SD(\@count_arr,$mean_val);
			push(@mn_ds_arr,$mean_val/$len);
			push(@mn_ds_arr,$sd_val/$len);
		} else {
			my $mean_val = 0;
			my $sd_val = 0;
			push(@mn_ds_arr,$mean_val/$len);
			push(@mn_ds_arr,$sd_val/$len);
		}
		
	}

	return(\@mn_ds_arr);	
}

sub SD {
	my @intput_arr = @{$_[0]};
	my $mn_val = $_[1];
	my $sum_sqr = 0;
	my $n = scalar(@intput_arr);
	my $mean_sqr_diff;
	my $sddv;

	for (my $i = 0; $i <@intput_arr; $i++) {
		my $diff = $intput_arr[$i] - $mn_val;
		my $sqr_diff = $diff * $diff;
		$sum_sqr = $sum_sqr + $sqr_diff;
	}

	$mean_sqr_diff = $sum_sqr/$n;
	$sddv = sqrt($mean_sqr_diff);
	return($sddv);
}

sub Mean {
	my @intput_arr = @{$_[0]};
	my $sum = 0;
	my $n = scalar(@intput_arr);
	my $mnn;

	for ( my $i = 0; $i <@intput_arr; $i++) {
		$sum = $sum + $intput_arr[$i];
	}

	$mnn = $sum/$n;
	return($mnn);
}
1;
