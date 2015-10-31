
load dataset1.mat;
% test for various k-s

% cov 'full'
GMModel = TrainGmm(moun_train,4,'diag',5,'plus');
% cov 'diagonal'
