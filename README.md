# EcircPred
Sequence and Secondary structural property based computational identification of Exonic Circular RNAs

EcircPred is used to predict Exonic Circular RNAs from the Protein coding mRNAs using the statistics(mean and standard deviation) of distribution of the di-nucleotide index, di-nucleotide RNA entropy value(feature number 115 of DiProDB) and emission probability of secondary structural elements context like pairedness(P),hairpin loop(H),internal loop(I),multi loop(M),external region(E) calculated using modified version of RNAplfold program used in RNAcontext software. We have build pipeline for predition of the Exonic Circular RNAs which is as follows.In first step we extract the feature from the specified sequences using above mentioned three features. The feature values are normalzied using the home build script. Then the each of feature vectors are given as input to the corssponding RNN build model and outputs are used as input to the voting scheme. In final step using the voting scheme final class is decided.

Introduction :
1. The input sequences used in feature extraction, training and testing are present in data folder.
2. The codes used in feature extraction and other processing  and model are present in scripts folder.
3. Software needed :
     Perl should be installed.
     MATLAb should be installed.
     Python should be installed.
     RNAplfold scripts should be downloaded from RNAcontext web site(http://www.cs.toronto.edu/~hilal/rnacontext/).
4. Prepare taget class of the test sequence and put it in script folder
5. Put test sequences file in script folder
5. Start Matlab and run EcircPred.m to get the accuracy of predition
