
%%%%%%%%%%%%%% 统计度和其他 rank 值的关系 %%%%%%%%%%%%%%
%%%% rank可以为preciision 、 rating 等  %%%%%%%%%%%%%% 
%%%%%%%%%%%% 输入：各个用户的度+各个用户的rank  列向量 %%%%%%%%%
%%%%%%%%%%%%% 输出：度相等的用户取其rank的平均值  然后输出各个度以及多对应的平均的rank值%%%%%

%%%%%%%%%%% 注意此时要统计各自的误差 以便绘制出 errorbar  below为图形下方的距离 也即是最小值和平均值的偏差 above则为最大值与其的偏差 %%%%%%%%

function [x, average, below, above, error] = distribution(degree,rank)
  
	avi1 = degree;
	avi3 = rank; %%%%每个用户的评价指标值
	avi3(isnan(avi3)) = 0;
	avi3(isinf(avi3)) = 0;
	avi4 = [avi1,avi3]; %%2列
	x = unique(avi1); %%%度的分布
	average = zeros(size(x)); 
    below = max(max(rank)) * ones(size(x));
    above = min(min(rank)) * ones(size(x)); 
    error = [];
	for i = 1:length(x)
	    count = 0;
	    for j = 1:length(avi4)
            if avi4(j, 1) == x(i, 1);
               count = count + 1;
               average(i, 1) = average(i,1) + avi4(j,2);
               below(i, 1) = min(below(i,1), avi4(j,2)); %%存最小值		  
               above(i, 1) = max(above(i,1), avi4(j,2));	%%%保存最大值
            end
	    end
	    average(i, 1) = average(i, 1)/count;
        %%%%计算方差
        clear sat
        sat = find(degree == x(i,1));
        sat = rank(sat);
        sat = sat  - average(i, 1) ;
        sat = sat.^2;
        sat = mean(sat);
        error = [error; sat];
        %%%%%%%
        
	    clear count;
	end
	average(isnan( average )) = 0;
	average(isinf( average )) = 0;

    below = average - below ;%%%存图形下方的距离
	above = above - average; %%存图形上方的距离 

end