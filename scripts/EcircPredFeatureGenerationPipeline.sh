#!/sh

echo "prerocessing"
perl calculate_di_nucleotide_freq.pl sample.txt dint_freq.txt

./E_RNAplfold -W 240 -L 160 -u 1 <sample.txt >E_profile-sample.txt 
./H_RNAplfold -W 240 -L 160 -u 1 <sample.txt >H_profile-sample.txt 
./I_RNAplfold -W 240 -L 160 -u 1 <sample.txt >I_profile-sample.txt 
./M_RNAplfold -W 240 -L 160 -u 1 <sample.txt >M_profile-sample.txt 
python combine_letter_profiles.py E_profile-sample.txt H_profile-sample.txt I_profile-sample.txt M_profile-sample.txt 1 combined_profile-sample.txt 
perl get_sec_structure_elements.pl combined_profile-sample.txt sceondary_str_profile-sample.txt
perl combine_seq_str_info.pl sample.txt sceondary_str_profile-sample.txt combined_seq_str_profile_sample.txt

echo "feature generation"
perl FeatureCal.pl sample.txt kmer2 dint_freq.txt ../data/DiProDB_115_Entropy_RNA combined_seq_str_profile_sample.txt 
echo "feature normalization"
perl feature_normalization.pl ../data/all_coumn_means_115_Entropy_RNA.txt rna_entropy_feature.txt normalized_rna_entropy_feature.txt
perl feature_normalization.pl ../data/all_coumn_means_train_emssion.txt emission_prob_feature.txt normalized_emission_prob_feature.txt
perl feature_normalization.pl ../data/all_coumn_means_train_kmer2_index.txt dint_index_feature.txt normalized_dint_index_feature.txt
echo "feature normalization done"
