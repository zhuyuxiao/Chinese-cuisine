

%%%%% 统计rank 值不重复值的 次数分布  
%%%% 输入参数为行向量 %%%%%%%%
%%%%输出按rank比例 值降序排列

function [result, count] = statistics(rank)  %%rank 为行向量

    clear data result count result sat;
    data = rank; %%%%
    result = unique(data); %%%
    count = zeros(1, length(result));
    for i = 1:length(result)
        count(1,i) = length(find(rank==result(1,i))) / length(rank);     
    end
    count(isinf(count)) = 0;
    count(isnan(count)) = 0;

   [result, sat] = sort(result,2);%%按rank值升序排列
   count = count(sat);
%  累计概率
   for j = 1:length(count)
       count(1,j) = sum(count(1,j:length(count)));
   end
%     
end


