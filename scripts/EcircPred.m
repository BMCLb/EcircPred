system('sh EcircPredFeatureGenerationPipeline.sh');

tst_seq_115 = load('normalized_rna_entropy_feature.txt');
tg_tst_seq_115 = load('target_sample.txt');
tmp = size(tg_tst_seq_115);
total = tmp(1);
load('network_115.mat');
tst_seq_115 = tst_seq_115';
tg_tst_seq_115 = tg_tst_seq_115';
tst_out_seq_115 = sim(network115,tst_seq_115);
tg_tst_val_seq_115 = (tg_tst_seq_115(1,:)>tg_tst_seq_115(2,:));
tst_out_val_seq_115 = (tst_out_seq_115(1,:)>tst_out_seq_115(2,:));

tst_seq_indx = load('normalized_dint_index_feature.txt');
tg_tst_seq_indx = load('target_sample.txt');
tst_seq_indx = tst_seq_indx';
tg_tst_seq_indx = tg_tst_seq_indx';
load('network_index.mat');
tst_out_seq_indx = sim(network_index,tst_seq_indx);
tg_tst_val_seq_indx = (tg_tst_seq_indx(1,:)>tg_tst_seq_indx(2,:));
tst_out_val_seq_indx = (tst_out_seq_indx(1,:)>tst_out_seq_indx(2,:));

tst_seq_emission = load('normalized_emission_prob_feature.txt');
tg_tst_seq_emission = load('target_sample.txt');
temp= size(tg_tst_seq_emission);
total = temp(1);
tst_seq_emission = tst_seq_emission';
tg_tst_seq_emission = tg_tst_seq_emission';
load('network_emission.mat');
tst_out_seq_emission = sim(network_emission,tst_seq_emission);
tg_tst_val_seq_emission = (tg_tst_seq_emission(1,:)>tg_tst_seq_emission(2,:));
tst_out_val_seq_emission = (tst_out_seq_emission(1,:)>tst_out_seq_emission(2,:));

tstout_115 = tst_out_val_seq_115;
tstout_dntindx =tst_out_val_seq_indx;
tstout_emission =tst_out_val_seq_emission;
target_all = tg_tst_val_seq_115;

decn_asmbly =[tstout_115;tstout_dntindx;tstout_emission];
sum_decn = sum(decn_asmbly);
comb_decn = (sum_decn>1);
comb_eff = sum(target_all == comb_decn)/total

c1 = ones(1,total/2);
c2 = zeros(1,total/2);
c1_out_count = 0;
c2_out_count = 0;

for a = 1:(total/2) 
   if comb_decn(a) == target_all(a)
		c1_out_count = c1_out_count+1;
    end 
end

circ_sens = (c1_out_count/length(c1))*100

for b = (total/2)+1:total
	if comb_decn(b) == target_all(b)
		c2_out_count = c2_out_count+1;
	end
end 
circ_spec = (c2_out_count/length(c2))*100

