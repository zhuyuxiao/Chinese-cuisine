

%%%%%%-----PCA

data = load('data/real_result/frequency_component_guiyi.txt'); %%% 2911行 20列
data = data'; %%% 20行 2911列 
[cof,score,latent,t] = princomp(data);
latent = cumsum(latent)./sum(latent); %%%  计算每个数据的累积贡献值  取使得贡献率大于95%的第一个值即可 
pca_num = min( find(latent>0.95));
%pca_num = 2;
tran = cof(:,1:pca_num); %%% cof中前pca_num列即为 转换矩阵

pca_data = data * tran; %%数据*转换矩阵 = 原数据在主成分空间下面的分布
dlmwrite('pca.txt',pca_data,' ');  %%% 20行 13列 

% %3D 
% surfc(pca_data(1:20,1:3));
% colormap hsv;
% %% 

for i= 1:20
   scatter(pca_data(i,1),pca_data(i,2))
   hold on
end

% for i = 1:size(pca_data,1)
% plot(1:size(pca_data,2) ,pca_data(i,:));
% hold on;
% end