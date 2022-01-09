%% AXIS TABLE FUNC
% This function is responsible for the working of orientation selection.
function axisTableClick(hObject, eventdata, handles)
   global ax;
   global isHoriz;
   handles.datatable_row = eventdata.Indices(1);
   handles.datatable_col = eventdata.Indices(2);
   row = handles.datatable_row;
   col = handles.datatable_col;
   guidata(hObject, handles);
   if row == 1 && col == 1
       isHoriz = 1;
       s2 = uistyle('BackgroundColor','white');
       addStyle(ax,s2,'cell',[2,1]);
       s2 = uistyle('BackgroundColor','green');
       addStyle(ax,s2,'cell',[1,1]);
   end
   if row == 2 && col == 1
       isHoriz = 0;
       s2 = uistyle('BackgroundColor','white');
       addStyle(ax,s2,'cell',[1,1]);
       s2 = uistyle('BackgroundColor','green');
       addStyle(ax,s2,'cell',[2,1]);
   end
end