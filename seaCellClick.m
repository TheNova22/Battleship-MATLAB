%% SEA FUNC
% This function is responsible for the working of clicks on the board
function seaCellClick(hObject, eventdata, handles)
       global type;
       global placed;
       global shipSelected;
       global shipSizes;
       global isHoriz;
       global player;
       global opponent;
       global uit;
       global done;
       handles.datatable_row = eventdata.Indices(1);
       handles.datatable_col = eventdata.Indices(2);
       row = handles.datatable_row(1);
       col = handles.datatable_col(1);
       guidata(hObject, handles);
       [m, n] = size(player.sea);
       % If its insertion
       if type == 0 && player.sea(row,col) == 0
           a = cell2mat(shipSizes(shipSelected)) - 1;
           % Check if ship fits and doesnt overlap with other ships
           if isHoriz && col + a <= n && checker(isHoriz,row,col,a,player.sea)
               player.sea(row,col:col+a) = shipSelected;
               indices = [0 0];
               for i = col:col+a
                 s2 = uistyle('BackgroundColor','green');
                 addStyle(uit,s2,'cell',[row,i]);
                 indices = [indices ; [row, i]];
               end
               indices = indices(2:end, 1:end);
               uit.Data = player.sea;
               if isempty(player.ships)
                   player.ships = [Ship(shipSelected,indices)];
               else
                   player.ships = [player.ships Ship(shipSelected,indices)];
               end
           end
         if ~ isHoriz && row + a <= m && checker(isHoriz,row,col,a,player.sea)
             player.sea(row:row+a,col) = shipSelected;
             indices = [0 0];
             for i = row:row+a
                 s2 = uistyle('BackgroundColor','green');
                 addStyle(uit,s2,'cell',[i,col]);
                 indices = [indices ; [i, col]];
             end
             indices = indices(2:end, 1:end);
             uit.Data = player.sea;
             if isempty(player.ships)
                   player.ships = [Ship(shipSelected,indices)];
             else
                   player.ships = [player.ships Ship(shipSelected,indices)];
             end
         end
       end
         % If its battle
         if type == 1
             global shipList;
             global done;
             shipList = opponent.ships;
             [m1,~] = size(player.miss);
             [m2,~] = size(player.hit);
             yes = 1;
             % Make sure that they don't hit the same cell again
             if m1 > 0
                 arr1 = ismember([row ,col],player.miss, 'rows');
                 yes = yes & ~ismember(arr1,1);
             end
             if m2 > 0
                 arr2 = ismember([row ,col],player.hit, 'rows');
                 yes = yes & ~ismember(arr2,1);
             end
             if yes && done == 0
                 result = battleshipShotCheck(opponent.sea,row,col);
                 opponent.ships = shipList;
             % if they hit water
             if result == 0
                 if m1 >= 1
                        player.miss = [player.miss; [row, col]];
                        done = 1;
                 end
                 if m1 < 1
                     player.miss = [row,col];
                     done = 1;
                 end
                 s2 = uistyle('BackgroundColor','red');
                 addStyle(uit,s2,'cell',[row,col]);
             end
             % if they hit sea
             if result > 0
                 if m2 >= 1
                        player.hit = [player.hit; [row, col]];
                        done = 1;
                 end
                 if m2 < 1
                     player.hit = [row,col];
                     done = 1;
                 end
                 s2 = uistyle('BackgroundColor','yellow');
                 addStyle(uit,s2,'cell',[row,col]);
                 player.points = player.points + result;
                 global info2;
                 % update points
                 info2.Data = player.points;
                 
                 
             end
             end


         end
     if done
         placed = 1;
     end
 end