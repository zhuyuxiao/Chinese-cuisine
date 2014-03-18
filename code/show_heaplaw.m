
%%%%%%%%%%%%% 8 ----≈‰¡œµƒheap's law %%%%%%%%%%%%%%%
data = load('data/real_result/heap_law.txt');
loglog( mean(data));
hold on
x = 1:length(data);
y =10* x.^(0.4978);
loglog(x,y );
xlabel({'Number of all ingredients'},'FontSize',12,'FontName','Arial');
ylabel({'Number of unique ingredients'},'FontSize',12,'FontName','Arial');