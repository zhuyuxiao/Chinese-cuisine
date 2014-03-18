

%%% 
caixi_name = {'lucai','chuancai','yuecai','sucai','mincai','zhecai','xiangcai','huicai','dongbeicai','gangtai','hubeicai','hucai','jiangxicai','jingcai','other',...
	    		  'qingzhencai','shanxicai','xibeicai','yucai','yunguicai'};
data = load('data/real_result/frequency_component.txt'); %% 2911*20
tempeature = load('data/real_result/climate.txt'); %% 20*2
tempeature =  tempeature(:,1);

%with outliers
data(:,15) = [];
tempeature(15,:) = [];
res1 = [];
for i = 1:size(data,1)
    clear p5 p6;
    if sum(data(i,:)) >0
        p5 = data(i,:);
        p6 = tempeature';
        p5 = p5- mean(p5);
        p6 = p6-mean(p6);
        p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
        res1 = [res1;i p5];
    end
end
dlmwrite('data/real_result/pcc_with_tempeature_ingredient.txt',[res1],' ');
temp = res1(:,2);
[tt, sat1] = sort(temp,'descend');
disp('top-10 positive correlated ingredients:');
sat1(1:10,:)'
disp('top-10 negative correlated ingredients:');
sat1(length(sat1):-1:length(sat1)-9,:)'

temp = abs(res1(:,2));
[tt,sat1] = sort(temp,'ascend');
disp('top-10 no correlated ingredients:');
sat1(1:10,:)'



%%%%%%%%%%%
disp('only consider ingredinets occurs in all cuisines')
clear all
caixi_name = {'lucai','chuancai','yuecai','sucai','mincai','zhecai','xiangcai','huicai','dongbeicai','gangtai','hubeicai','hucai','jiangxicai','jingcai','other',...
	    		  'qingzhencai','shanxicai','xibeicai','yucai','yunguicai'};
data = load('data/real_result/frequency_component.txt'); %% 2911*20
tempeature = load('data/real_result/climate.txt'); %% 20*2
tempeature =  tempeature(:,1);

%with outliers
data(:,15) = [];
temp = full( spones(data) );
temp = sum(temp,2);
temp = find(temp<15);
data(temp,:) = []; %% delete ingredients that didn't appear in all cuisines

tempeature(15,:) = [];
res1 = [];
for i = 1:size(data,1)
    clear p5 p6;
    if sum(data(i,:)) >0
        p5 = data(i,:);
        p6 = tempeature';
        p5 = p5- mean(p5);
        p6 = p6-mean(p6);
        p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
        res1 = [res1;i p5];
    end
end
dlmwrite('data/real_result/pcc_with_tempeature_ingredient.txt',[res1],' ');
temp = res1(:,2);
[tt, sat1] = sort(temp,'descend');
disp('top-10 positive correlated ingredients:');
sat1(1:10,:)'
disp('top-10 negative correlated ingredients:');
sat1(length(sat1):-1:length(sat1)-9,:)'

temp = abs(res1(:,2));
[tt,sat1] = sort(temp,'ascend');
disp('top-10 no correlated ingredients:');
sat1(1:10,:)'
