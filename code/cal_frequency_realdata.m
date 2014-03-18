
% 
% 各个菜系 配料的比例 （不归一、归一的） 
% 所有菜系  所有配料的使用次数
% recipe id 从0开始  配料的id从1开始
caixi_name = {'lucai','chuancai','yuecai','sucai','mincai','zhecai','xiangcai','huicai','dongbeicai','gangtai','hubeicai','hucai','jiangxicai','jingcai','other',...
	    		  'qingzhencai','shanxicai','xibeicai','yucai','yunguicai'};
num_recipe =  [1066,1148,775,372,468,460,691,218,358,151,160,744,143,606,52,521,125,188,173,79];
num_component = 2911;              
frequency_recipe =[];
frequency_recipe_guiyi = [];
frequency_ing = zeros(1, num_component);
N_ing = [];
Avg_ing = [];
Avg_ing_all = 0;
for i = 1:length(caixi_name)
     clear data_network data_recipe_id network temp; 
     data_network = load( strcat('data/network/network/',caixi_name{i},'_network.txt'));
     network = zeros( num_recipe(i), num_component);
     
     for k = 1:length(data_network)
        network( data_network(k, 1)+1, data_network(k, 2)) = 1;    
     end 
     Avg_ing_all = Avg_ing_all + nnz(network);
     temp = sum(network, 1);
     N_ing = [N_ing, nnz(temp)];
     Avg_ing = [Avg_ing, mean(sum(network,2))];
     frequency_recipe = [frequency_recipe; temp./num_recipe(i)];
     frequency_recipe_guiyi = [ frequency_recipe_guiyi; temp/nnz(network)];
     frequency_ing = frequency_ing + temp;
end
disp('各菜系的配料不同个数：'); N_ing
disp('各菜系每道菜所用配料的平均值'); Avg_ing
disp('全局上所有recipe平均配料个数：'); Avg_ing_all/sum(num_recipe)
%%%%frequency_recipe 2911*20矩阵 
dlmwrite( strcat('data/real_result/', 'frequency_component_guiyi.txt'),frequency_recipe_guiyi',' '); %%%归一化的 
dlmwrite( strcat('data/real_result/', 'frequency_component.txt'),frequency_recipe',' '); %%%未归一化的 
dlmwrite( strcat('data/real_result/', 'frequency_ingredient_all.txt'),frequency_ing',' ');
 