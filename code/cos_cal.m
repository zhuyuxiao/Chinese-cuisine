
%%%%% 对两个序列计算kendall tau改进后的值
%%%其中分数相同的排名一致 
%%%%
function tau = cos_cal(data1, data2)  %% 列向量

    tau = sum(data1.*data2);
    tau = tau/sqrt(sum(data1.^2)*sum(data2.^2));

end
