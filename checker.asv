%% CHECKER
% This function makes sure that there is no overlap between multiple ships.
function [res] = checker(horiz,row,col,a,sea)
    res = 1;
       if horiz == 1
           for i = col:col+a
               if i > 10
                   break
               end
               if sea(row,i) ~= 0
                   res = 0;
                   return;
               end
           end
        end
       if horiz == 0
           for i = row:row+a
               if i > 10
                   break
               end
               if sea(i,col) ~= 0
                   res = 0;
                   return;
               end
           end
       end
end