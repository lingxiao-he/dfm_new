num_bases = 128;
beta = 0.4;
num_iters = 5;
sparsity_func= 'L1';
epsilon = [];
Binit = [];
fname_save = sprintf('../results/sc_%s_b%d_beta%g_%s', sparsity_func, num_bases, beta, datestr(now, 30));
feature_map_selection_index = [1,6,17,35,40,54,63,67,103,115,127,142,169,175,176,180,202,233,242,254,286,299,302,323,344,354,374,377,383,408,411,415,420,431,438,454,461,477,480,496,504];
lambda = 1.4;
run(fullfile(fileparts(mfilename('fullpath')),...
    '..', 'matlab', 'vl_setupnn.m')) ;


