

%%% combaine the similarities of model results and geographic distance/tempertance difference  
caixi_name = {'lucai','chuancai','yuecai','sucai','mincai','zhecai','xiangcai','huicai','dongbeicai','gangtai','hubeicai','hucai','jiangxicai','jingcai','other',...
	    		  'qingzhencai','shanxicai','xibeicai','yucai','yunguicai'};
 metric = {'PCC','cos'};
 %%---- the model results
 for i = 1:length(metric)
     clear data distance sat res
     disp(metric{i});
     distance = load('data/real_result/geographic distance.txt');
     data = load(strcat('data/model_result/',metric{i},'_model2_5_0.85sim.txt'));
     %--- delete other cuisine
     data(:,15)=[]; 
     data(15,:)=[]; 
     distance(15,:) = [];
     distance(:,15) = [];
     %------------------
     sat = find(data);
     res = [data(sat),distance(sat)];
     dlmwrite(strcat('model_',metric{i},'_vs_geodist.txt'),res,' ');
     disp('with outliers..');
     
     %---delete outliers (HK,yungui)-----
     data(:,[10,19])=[]; 
     data([10,19],:)=[]; 
     distance([10,19],:) = [];
     distance(:,[10,19]) = [];
     %------------------
     sat = find(data);
     res = [data(sat),distance(sat)];
     dlmwrite(strcat('model_',metric{i},'_vs_geodist_deleteoutliers.txt'),res,' ');
     disp('without outliers..');   
 end
 
 
 
%%2--- the results of the dataset  distance and climate
 for i = 1:length(metric)
     clear data distance sat res climate
     disp(metric{i});
     distance = load('data/real_result/geographic distance.txt');
     climate = load('data/real_result/climate.txt'); %% tempeture + humidity
     climate = climate(:,1);  %% tempeture 
     climate = repmat(climate,[1,length(climate)]);
     climate = abs( climate - climate');
     data = load(strcat('data/real_result/',metric{i},'_weighted.txt'));
     data = triu(data,1);
     %--- delete other cuisine
     data(:,15)=[]; 
     data(15,:)=[]; 
     distance(15,:) = [];
     distance(:,15) = [];
     climate(15,:) = [];
     climate(:,15) = [];
     %------------------
     sat = find(data);
     res = [data(sat),distance(sat)];
     dlmwrite(strcat(metric{i},'_vs_geodist.txt'),res,' ');
     res_climate = [data(sat),climate(sat)];
     dlmwrite(strcat(metric{i},'_vs_climate.txt'),res_climate,' ');     
     disp('with outliers..');
     
     %---delete outliers (HK,yungui)-----
     data(:,[10,19])=[]; 
     data([10,19],:)=[]; 
     distance([10,19],:) = [];
     distance(:,[10,19]) = [];
     climate([10,19],:) = [];
     climate(:,[10,19]) = [];
     %------------------
     sat = find(data);
     res = [data(sat),distance(sat)];
     dlmwrite(strcat(metric{i},'_vs_geodist_deleteoutliers.txt'),res,' ');
     res_climate = [data(sat),climate(sat)];
     dlmwrite(strcat(metric{i},'_vs_climate_deleteoutliers.txt'),res_climate,' ');  
     disp('without outliers..');   
 end
 
