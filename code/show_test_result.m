 
 
  %%%  similarity of two hops Vs >2hops pairs

  format long
  distance = load('data/real_result/topological distance.txt');
  distance = distance + distance';
  distance([15],:)=[];
  distance(:,[15])=[];
  distance = triu( distance, 1); 
  metric = {'PCC','cos'};

  for i = 1:2
           clear tau;
           disp(strcat('with outliers'));
           
%            %% zuofa
           tau = load( strcat('data/real_result/zuofa_',metric{i},'_weighted.txt'));

            %%%% ingredient
           %tau = load( strcat('data/real_result/',metric{i},'_weighted.txt'));

           tau([15],:)=[];
           tau(:,[15])=[];
           sat1 = find( distance<=2 & distance>0);
           value1 = tau( sat1);
           sat2 = find( distance>2 );
           value2 = tau(sat2);      
           pvalue = test(value2,value1,10000);
           disp( strcat(metric{i},':',num2str(pvalue)));
 end 
  
distance([10,19],:)=[];
distance(:,[10,19]) = [];
  for i = 1:2
           clear tau;
           disp('without outliers')
           
%            %% zuofa
            tau = load( strcat('data/real_result/zuofa_',metric{i},'_weighted.txt'));

           %%%% ingredient
           %tau = load( strcat('data/real_result/',metric{i},'_weighted.txt'));

           tau([10,15,20],:)=[];
           tau(:,[10,15,20])=[];
           sat1 = find( distance<=2 & distance>0);
           value1 = tau( sat1);
           sat2 = find( distance>2 );
           value2 = tau(sat2);      
           pvalue = test(value2,value1,100000);
           disp( strcat(metric{i},':',num2str(pvalue)));
 end 
  

  
  
