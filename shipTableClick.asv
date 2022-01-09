%% SHIP TABLE FUNC
% This function is responsible for making the ship selection work
function shipTableClick(hObject, eventdata, handles)
   global shipSelected;
   global shipTable;
   handles.datatable_row = eventdata.Indices(1);
   handles.datatable_col = eventdata.Indices(2);
   row = handles.datatable_row;
   col = handles.datatable_col;
   guidata(hObject, handles);
   s2 = uistyle('BackgroundColor','white');
   addStyle(shipTable,s2,'cell',[shipSelected,1]);
   s2 = uistyle('BackgroundColor','green');
   addStyle(shipTable,s2,'cell',[row,col]);
   shipSelected = row;
end