% % 
%%%%%%%%caculate pvalue between geographical distance (temperature difference)  and
%%%%%%%%similarities %%%%%%
format long
x = {'geographic distance','climate'};
index ={'PCC','cos'};
count = 100000;
for jj = 1:2  %% jj==1: geograohical distance, jj==2: tempertaure difference
    disp(x{jj});
    clear distance;
    distance = load( strcat('data/real_result/',x{jj},'.txt'));
    if jj == 1 
        distance = distance + distance';
    else
        distance = distance(:,1);
        distance = repmat(distance,[1,length(distance)]);
        distance = abs(distance - distance');
    end
    
    for n = [1,2]
        tau = load( strcat('data/real_result/',index{n},'_weighted.txt') );
        tau = tau+tau';
        for kk = 1:2 %% kk==1: with outliers, kk=2:withoutliers
           if kk == 1 %% kk==1: with outliers
               disp('with outliers...')
               clear temp_dis temp_tau
               temp_dis = distance;
               temp_dis([15],:)=[];
               temp_dis(:,[15])=[];
               temp_dis = triu( temp_dis, 1); 
               temp_tau = tau;
               temp_tau([15],:)=[];
               temp_tau(:,[15])=[];
               temp_tau = triu( temp_tau, 1);                
           else  % kk=2:withoutliers
               disp('without outliers...')
               clear temp_dis temp_tau
               temp_dis = distance;
               temp_dis([10,15,20],:)=[];
               temp_dis(:,[10,15,20])=[];
               temp_dis = triu( temp_dis, 1);  
               temp_tau = tau;
               temp_tau([10,15,20],:)=[];
               temp_tau(:,[10,15,20])=[];
               temp_tau = triu( temp_tau, 1);  
           end
            
           clear sat p5 p6 p
            sat = find(temp_dis);
            temp_dis = temp_dis( sat );
            temp_tau = temp_tau( sat );
            p5 = temp_dis;
            p6 = temp_tau;
            p5 = p5- mean(p5);
            p6 = p6-mean(p6);
            p5 = sum(p5.*p6)/sqrt(sum(p5.^2)*sum(p6.^2));
            p = 0;
            for i = 1:count
                clear dis1 tau1
                dis1 = temp_dis;
                tau1 = temp_tau(randperm(length(temp_tau)));  %% random tau
                dis1 = dis1 - mean(dis1);
                tau1 = tau1 - mean(tau1);
                dis1 = sum(dis1.*tau1)/sqrt(sum(dis1.^2)*sum(tau1.^2));
                if dis1 <= p5
                    p = p+1;
                end
            end
            disp( strcat('pvalue: ',index{n},':',num2str(p/count)));
       end
    end   
end
    
