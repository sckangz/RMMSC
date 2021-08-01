function [res]= myNMIACC_V6(U,Y,numclass)%U谱聚类的结果，Y-labels分类标签

stream = RandStream.getGlobalStream;
reset(stream);
U_normalized = U ./ repmat(sqrt(sum(U.^2, 2)), 1, size(U, 2));
maxIter = 50;


indx = litekmeans(U_normalized,numclass, 'MaxIter',100, 'Replicates',maxIter);
%% indx = kmeans(U_normalized,numclass, 'MaxIter',100, 'Replicates',maxIter);
indx = indx(:);
[newIndx] = bestMap(Y,indx);
res(1) = mean(Y==newIndx);  
res(2) = MutualInfo(Y,newIndx);
res(3) = purFuc(Y,newIndx); 