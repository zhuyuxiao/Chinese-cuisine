


%%%%%%%%  caculate the PCC between geographical distance and regional
%%%%%%%%  cuisines similaities  %%
 disp( 'geographical distance and similarites');
 metric = {'PCC','cos'};
 pop_copy = 0.85;
 ing_num_mutate = 2;
 gama = 5;
 distance = load('data/real_result/geographic distance.txt');
 distance([15],:)=[];
 distance(:,[15])=[];
 distance = triu( distance, 1); 
 for n = 1:length(metric)
     clear data  sat res
     tau = load(strcat('data/model_result/',metric{n},'_model',num2str(ing_num_mutate),'_',num2str(gama),'_',num2str(pop_copy),'sim.txt'));
     %--- delete other cuisine
     tau([15],:)=[];
     tau(:,[15])=[];
     p5 = distance(find(distance));
     p6 = tau(find(distance));
     dis_p = p5;
     tau_p = p6;
     p5 = p5- mean(p5);
     p6 = p6-mean(p6);
     p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
     count = 10000;
     p = 0;
     for i = 1:count
        clear dis1 tau1
        dis1 = dis_p;
        tau1 = tau_p(randperm(length(dis_p))); 
        dis1 = dis1 - mean(dis1);
        tau1 = tau1 - mean(tau1);
        dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
        if dis1 <= p5
            p = p+1;
        end
     end
     disp( strcat(metric{n},':','with outliers',':',num2str(p5),'  p-value=',num2str(p/count)));
    
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
    dis_p = p5;
    tau_p = p6;
    p5 = p5- mean(p5);
    p6 = p6-mean(p6);
    p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
    count = 10000;
    p = 0;
    for i = 1:count
        clear dis1 tau1
        dis1 = dis_p;
        tau1 = tau_p(randperm(length(dis_p))); 
        dis1 = dis1 - mean(dis1);
        tau1 = tau1 - mean(tau1);
        dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
        if dis1 <= p5
            p = p+1;
        end
    end
    disp( strcat(metric{n},':','without outliers',':',num2str(p5),'  p-value=',num2str(p/count)));
    
 end


 
 clear all
 disp( 'delete pairs >2500KM ');
 metric = {'PCC','cos'};
 pop_copy = 0.85;
 ing_num_mutate = 2;
 gama = 5;
 distance = load('data/real_result/geographic distance.txt');
 distance([15],:)=[];
 distance(:,[15])=[];
 distance = triu( distance, 1); 
 for n = 1:length(metric)
     clear data  sat res
     tau = load(strcat('data/model_result/',metric{n},'_model',num2str(ing_num_mutate),'_',num2str(gama),'_',num2str(pop_copy),'sim.txt'));
     %--- delete other cuisine
     tau([15],:)=[];
     tau(:,[15])=[];
     p5 = distance(find(distance>0 &distance<2500));
     p6 = tau(find(distance>0 &distance<2500));
     dis_p = p5;
     tau_p = p6;
     p5 = p5- mean(p5);
     p6 = p6-mean(p6);
     p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
     count = 10000;
     p = 0;
     for i = 1:count
        clear dis1 tau1
        dis1 = dis_p;
        tau1 = tau_p(randperm(length(dis_p))); 
        dis1 = dis1 - mean(dis1);
        tau1 = tau1 - mean(tau1);
        dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
        if dis1 <= p5
            p = p+1;
        end
     end
     disp( strcat(metric{n},':','with outliers',':',num2str(p5),'  p-value=',num2str(p/count)));
    
    %%%% delete outliers --HK YunGui
    p5 = distance;
    p6 = tau;
    p5([10,19],:) = [];
    p5(:,[10,19]) = [];
    p6([10,19],:) = [];
    p6(:,[10,19]) = [];
    sat = find(p5>0 & p5<2500);
    p5 = p5(sat);
    p6 = p6(sat);
    dis_p = p5;
    tau_p = p6;
    p5 = p5- mean(p5);
    p6 = p6-mean(p6);
    p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
    count = 10000;
    p = 0;
    for i = 1:count
        clear dis1 tau1
        dis1 = dis_p;
        tau1 = tau_p(randperm(length(dis_p))); 
        dis1 = dis1 - mean(dis1);
        tau1 = tau1 - mean(tau1);
        dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
        if dis1 <= p5
            p = p+1;
        end
    end
    disp( strcat(metric{n},':','without outliers',':',num2str(p5),'  p-value=',num2str(p/count)));
    
end
