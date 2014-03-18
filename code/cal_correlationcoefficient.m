
%%%%%%%%  caculate the PCC between temperature difference(geographical distance) and regional
%%%%%%%%  cuisines similaities  %%

%------ temperature difference ---------
disp( 'caculate pearson correlation coefficient.............');
distance = load('data/real_result/climate.txt');
distance = distance(:,1);
distance = repmat(distance,[1,length(distance)]);
distance = abs(distance - distance');
index ={'PCC','cos'};
distance([15],:)=[];
distance(:,[15])=[];
distance = triu( distance, 1); 
disp( 'temperature difference and similarites');
for n = [1,2]
    clear tau p5 p6;
    tau = load( strcat('data/real_result/',index{n},'_weighted.txt') );
    tau([15],:)=[];
    tau(:,[15])=[];

    p5 = distance(find(distance));
    p6 = tau(find(distance));
    p5 = p5- mean(p5);
    p6 = p6-mean(p6);
    p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
    disp( strcat(index{n},':','with outliers','--',num2str(p5)));
    
    %%%% delete outliers --HK YunGui
    p5 = distance;
    p6 = tau;
    p5([10,19],:) = [];
    p5(:,[10,19]) = [];
    p6([10,19],:) = [];
    p6(:,[10,19]) = [];
    sat = find(p5);
    p5 = p5(sat);
    p6 = p6(sat);
    p5 = p5- mean(p5);
    p6 = p6-mean(p6);
    p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
    disp( strcat(index{n},':','without outliers','--',num2str(p5)));
    
end


%%------ geographical distance --------------
clear all
distance = load('data/real_result/geographic distance.txt');
index ={'PCC','cos'};
distance([15],:)=[];
distance(:,[15])=[];
distance = triu( distance, 1); 
disp( 'geographical distance and similarites');
for n = [1,2]
    clear tau p5 p6;
    tau = load( strcat('data/real_result/',index{n},'_weighted.txt') );
    tau([15],:)=[];
    tau(:,[15])=[];

    p5 = distance(find(distance));
    p6 = tau(find(distance));
    p5 = p5- mean(p5);
    p6 = p6-mean(p6);
    p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
    disp( strcat(index{n},':','with outliers','--',num2str(p5)));
    
    %%%% delete outliers --HK YunGui
    p5 = distance;
    p6 = tau;
    p5([10,19],:) = [];
    p5(:,[10,19]) = [];
    p6([10,19],:) = [];
    p6(:,[10,19]) = [];
    sat = find(p5);
    p5 = p5(sat);
    p6 = p6(sat);
    p5 = p5- mean(p5);
    p6 = p6-mean(p6);
    p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
    disp( strcat(index{n},':','without outliers','--',num2str(p5)));
    
end

