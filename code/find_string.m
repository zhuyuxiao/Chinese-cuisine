
%%%%% 输出string 的id
%%%% rank为一个string 元胞数组
function id = find_string(rank, s)  
     
     id = -1;
     for i = 1:length(rank)
         if isequal( rank{i}, s)
         id = i;
         end
     end
 
end

