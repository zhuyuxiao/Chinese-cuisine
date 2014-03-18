
%%%% x,y是两个规模一致的行向量
%%  sim 是随机次数
%% alpha是显著性水品
% function [pvalue] = test(x,y,sim)
%       num = 0;
%       for i = 1:sim
%           clear sat xx yy ss dxy x1 y1 dxy1;
%           ss = min( length(x),length(y));
%           if length(x)>ss
%               sat = randperm( length(x));
%               sat = sat(1:ss);
%               xx = x(sat);
%               yy = y;
%           end
%           if length(y)>ss
%               sat = randperm( length(y));
%               sat = sat(1:ss);
%               yy = y(sat);
%               xx = x;
%           end
%           dxy = sqrt(sum((xx-yy).^2));
%           z = [xx;yy];
%           sat = randperm( length(z) );
%           x1 = z(sat(1:length(sat)/2));
%           y1 = z( sat(length(sat)/2+1:end));
%           dxy1 = sqrt( sum((x1-y1).^2));
%           if( dxy1>=dxy)
%               num = num+1;
%           end
%       end
%       pvalue = num/sim;
% end




%% x: hop<=2
%% y:hop>2
function [pvalue] = test(x,y,sim)
      num = 0;
      dxy = mean(y)-mean(x);
      z = [x;y];
      for i = 1:sim
          clear x1 y1 dxy1 sat ;   
          sat = randperm( length(z) );
          x1 = z(sat(1: length(x)));
          y1 = z( sat( length(x)+1:end));
          dxy1 = mean(y1)-mean(x1);
          if( dxy1>=dxy)
              num = num+1;
          end
      end
      pvalue = num/sim;
end
