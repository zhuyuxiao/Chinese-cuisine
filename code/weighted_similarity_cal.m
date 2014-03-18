% 
% %%%%%%%% TF-IDF based similarity %%%%%%%%%%%%%
% %%%%%%%%%%%%%%% 4-----PCC%%%%%%%
% clear all
% data = load('data/real_result/frequency_component_guiyi.txt');
% weight = load('data/real_result/frequency_ingredient_all.txt');
% weight = log( sum(weight)./weight);
% weight = repmat( weight, [1, 20]);
% data = data .* weight ; 
% pcc = zeros( size(data,2) ); %%2911*20
% ave = mean(data, 1);
% ave = repmat( ave, [ size(data,1),1]);
% ave = data - ave;
% for i = 1:size(data,2)-1
%     for j = i+1:size(data,2)
%        pcc(i,j) = sum( ave(:,i) .* ave(:,j) );
%        pcc(i,j) = pcc(i,j) / sqrt(  sum( ave(:,i).^2 ) );
%        pcc(i,j) = pcc(i,j) / sqrt(  sum( ave(:,j).^2 ) );
%        pcc(j,i) = pcc(j,i);               
%     end
% end
% dlmwrite('data/real_result/PCC_weighted.txt', pcc, ' ');
% 
% 

% %%%%%%%%%%%%%%% 4-----cos%%%%%%%
% clear all
% data = load('data/real_result/frequency_component_guiyi.txt');
% weight = load('data/real_result/frequency_ingredient_all.txt');
% weight = log( sum(weight)./weight);
% weight = repmat( weight, [1, 20]);
% data = data .* weight ; 
% pcc = zeros( size(data,2) );
% for i = 1:size(data,2)-1
%     for j = i+1:size(data,2)
%        pcc(i,j) = cos_cal(data(:,i),data(:,j));
%        pcc(j,i) = pcc(j,i);               
%     end
% end
% dlmwrite('data/real_result/cos_weighted.txt', pcc, ' ');

