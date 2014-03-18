

%%%%%%%similarity of two hops Vs >2hops pairs
 distance = load('data/real_result/topological distance.txt');
 distance = distance + distance';
 distance = triu( distance, 1); 
 metric = {'PCC','cos'};
 label = {'Real','Model'};
 maker = {'>','o','square','<'};
 p = 2;
 gmma = 5;
  
 
 for i = 1:2
       disp( metric{i});
       clear tau1 tau2;
       tau1 = load( strcat('data/real_result/',metric{i},'_weighted.txt'));  
      
       tau1 = triu(tau1,1);
       tau1(15,:)=[];
       tau1(:,15)=[];   
       distance([15],:)=[];
       distance(:,[15])=[];
       
       value = [];
       group = [];
       for j = 1:max(distance(:))-1
           value = [value;tau1( find( distance==j))];
           group = [group; j*ones(length(tau1( find( distance==j))),1)];
       end
       p = anova1(value,group)

       
       %% delete outliers
       tau1([10,19],:)=[];
       tau1(:,[10,19])=[];  
       distance([10,19],:)=[];
       distance(:,[10,19])=[];
       value = [];
       group = [];
       for j = 1:max(distance(:))-1
           value = [value; tau1( find( distance==j))];
           group = [group; j*ones(length(tau1( find( distance==j))),1)];
       end
       p = anova1(value,group)
       
 end

