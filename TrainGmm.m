%@k no of clusters
% @covType cov matrix type 'full' or 'diagonal'
% @iterations no.of iterations for EM algorithm
% @initType - 'randSample' or 'plus'(for kmeans clustering)
function [GMModel] = TrainGmm(trainData,k,covType,iterations,initType)
    GMModel = fitgmdist(trainData,k,'CovarianceType',covType,'Replicates',iterations,'Start',initType,'RegularizationValue',0.01);
end