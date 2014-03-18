

%% caculate partial correlation coefficient

dis_geo = load( strcat('data/real_result/geographic distance.txt'));
dis_geo = dis_geo + dis_geo';
dis_geo = triu(dis_geo,1);
climate =  load( strcat('data/real_result/climate.txt'));
climate = climate(:,1);
climate = repmat(climate,[1,length(climate)]);
climate = abs(climate - climate');
climate = triu(climate,1);

index = {'PCC','cos'};
for n = 1:2
    disp(index{n});
    tau = load( strcat('data/real_result/',index{n},'_weighted.txt') );
    tau = triu(tau,1);
    
    %%%% with outliers %%%%%
    tau(:,[15]) = [];
    tau([15],:) = [];
    climate([15],:)=[];
    climate(:,[15])=[];
    dis_geo(:,[15]) = [];
    dis_geo([15],:) = [];
    
    sat = find(dis_geo);
    dis = dis_geo(sat);
    temperature = climate(sat);
    sim = tau(sat);
    disp('with outliers');
    disp(strcat('P_{ geographical distance, PCC}, controlled temperature: ' ,num2str(partialcorr(sim,dis,temperature))));
    disp(strcat('P_{ temperature, PCC}, controlled geographical distance: ' ,num2str(partialcorr(sim,temperature,dis))));
    
    %%%% without outliers %%%%%
    climate([10,19],:)=[];
    climate(:,[10,19])=[];
    dis_geo([10,19],:)=[];
    dis_geo(:,[10,19])=[];
    tau(:,[10,19]) = [];
    tau([10,19],:) = [];
    
    sat = find(dis_geo);
    dis = dis_geo(sat);
    temperature = climate(sat);
    sim = tau(sat);
    disp('without outliers');
    disp(strcat('P_{ geographical distance, PCC}, controlled temperature: ' ,num2str(partialcorr(sim,dis,temperature))));
    disp(strcat('P_{ temperature, PCC}, controlled geographical distance: ' ,num2str(partialcorr(sim,temperature,dis))));
    
end


