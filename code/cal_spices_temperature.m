

%correlation between spices usage and temperature
caixi_name = {'lucai','chuancai','yuecai','sucai','mincai','zhecai','xiangcai','huicai','dongbeicai','gangtai','hubeicai','hucai','jiangxicai','jingcai','other',...
	    		  'qingzhencai','shanxicai','xibeicai','yucai','yunguicai'};
num_recipe =  [1066,1148,775,372,468,460,691,218,358,151,160,744,143,606,52,521,125,188,173,79];
num_component = 2911;
spice_id = [4,9,14,21,36,55,64,66,68,69,70,71,73,75,83,87,88,95,101,102,103,112,115,125,129,131,142,...
    165,179,181,199,200,201,202,203,204,207,235,238,246,247,256,267,277,286,313,320,337,344,345,351,...
    359,363,369,401,402,414,415,416,418,427,464,474,475,478,499,501,514,516,521,534,552,559,586,590,...
    618,622,623,650,651,663,675,697,698,709,711,714,733,736,748,757,769,775,792,808,809,812,821,825,...
    833,837,843,868,887,888,892,898,923,941,951,979,1002,1012,1024,1042,1061,1080,1107,1130,1153,1160,...
    1200,1217,1290,1315,1354,1394,1440,1441,1477,1498,1519,1581,1589,1600,1606,1611,1638,1639,1640,1649,...
    1654,1662,1677,1689,1717,1730,1752,1767,1776,1858,1862,1868,1892,1911,1924,2032,2049,2050,2056,2067,...
    2071,2098,2100,2140,2149,2161,2167,2179,2189,2194,2195,2209,2215,2230,2232,2236,2252,2256,2268,2311,...
    2318,2337,2339,2347,2386,2407,2431,2433,2444,2454,2467,2476,2487,2552,2576,2594,2595,2626,2627,2638,...
    2645,2650,2721,2728,2741,2781,2788,2819,2853,2895,2906,2911];
all_spice_usage = [];
meat_spice_usage = [];
for i = 1:length(caixi_name)
     clear data_network network temp spice_temp meat_recipe_id; 
     data_network = load( strcat('data/network/network/',caixi_name{i},'_network.txt'));
     meat_recipe_id = load( strcat('data/network/meat-based recipe/',caixi_name{i},'_meat_recipe_id.txt'));
     network = zeros(num_recipe(i), num_component);
     spice_temp = zeros(num_recipe(i), num_component);
     spice_temp(:,spice_id) = 1;
     
     for k = 1:length(data_network)
        network( data_network(k, 1)+1, data_network(k, 2)) = 1;    
     end 
     spice_temp = network .* spice_temp; %% only remain spices
     %spice_usage = [spice_usage; mean(sum(spice_temp,2)./sum(network,2))];
     all_spice_usage = [all_spice_usage; mean(sum(spice_temp,2))];
     
     spice_temp( meat_recipe_id+1, :) = [];
     meat_spice_usage = [meat_spice_usage; mean(sum(spice_temp,2))];

end
climate = load('data/real_result/climate.txt');
climate = climate(:,1);
% dlmwrite('temperature_spices.txt',[climate,spice_usage],' ');

climate([15],:)=[];
all_spice_usage([15],:) = [];
p5=climate;
p6=all_spice_usage;
p5 = p5 - mean(p5);
p6 = p6 - mean(p6);
p5 = sum(p5.* p6)/sqrt(sum(p5.^2)*sum(p6.^2));
p = 0;
count = 10000;
for i = 1:count
    clear dis1 tau1
    dis1 = climate;
    tau1 = all_spice_usage(randperm(length(climate))); 
    dis1 = dis1 - mean(dis1);
    tau1 = tau1 - mean(tau1);
    dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
    if dis1 <= p5
        p = p+1;
    end
end
disp( strcat('correlation coefficient (temperature and spice usage, with outliers): ',num2str(p5),'  p-value=',num2str(p/count)));

meat_spice_usage([15],:) = [];
p6 = meat_spice_usage;
p5 = climate;
p5 = p5 - mean(p5);
p6 = p6 - mean(p6);
p5 = sum(p5.* p6)/sqrt(sum(p5.^2)*sum(p6.^2));
p = 0;
count = 10000;
for i = 1:count
    clear dis1 tau1
    dis1 = climate;
    tau1 = meat_spice_usage(randperm(length(climate))); 
    dis1 = dis1 - mean(dis1);
    tau1 = tau1 - mean(tau1);
    dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
    if dis1 <= p5
        p = p+1;
    end
end
disp( strcat('correlation coefficient (temperature and spice usage, with outliers----- meat-based recipes): ',num2str(p5),'  p-value=',num2str(p/count)));


climate([10,19],:)=[];
all_spice_usage([10,19],:) = [];
p5=climate;
p6=all_spice_usage;
p5 = p5 - mean(p5);
p6 = p6 - mean(p6);
p5 = sum(p5.* p6)/sqrt(sum(p5.^2)*sum(p6.^2));
p = 0;
count = 10000;
for i = 1:count
    clear dis1 tau1
    dis1 = climate;
    tau1 = all_spice_usage(randperm(length(climate))); 
    dis1 = dis1 - mean(dis1);
    tau1 = tau1 - mean(tau1);
    dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
    if dis1 <= p5
        p = p+1;
    end
end
disp( strcat('correlation coefficient (temperature and spice usage, without outliers): ',num2str(p5),'  p-value=',num2str(p/count)));


meat_spice_usage([10,19],:) = [];
p6 = meat_spice_usage;
p5 = climate;
p5 = p5 - mean(p5);
p6 = p6 - mean(p6);
p5 = sum(p5.* p6)/sqrt(sum(p5.^2)*sum(p6.^2));
p = 0;
count = 10000;
for i = 1:count
    clear dis1 tau1
    dis1 = climate;
    tau1 = meat_spice_usage(randperm(length(climate))); 
    dis1 = dis1 - mean(dis1);
    tau1 = tau1 - mean(tau1);
    dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
    if dis1 <= p5
        p = p+1;
    end
end
disp( strcat('correlation coefficient (temperature and spice usage, without outliers----- meat-based recipes): ',num2str(p5),'  p-value=',num2str(p/count)));


% axes('FontSize',12,'FontName','Arial');
% scatter(climate,all_spice_usage); 
% xlabel('mean annual temperature (\circC)','FontSize',12,'FontName','Arial');
% ylabel('Number of spices per recipe','FontSize',12,'FontName','Arial');
% box('on');

axes('FontSize',12,'FontName','Arial');
scatter(climate, meat_spice_usage); 
xlabel('mean annual temperature (\circC)','FontSize',12,'FontName','Arial');
ylabel('Number of spices per recipe','FontSize',12,'FontName','Arial');
box('on');
