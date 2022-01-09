% This is the class definition for a ship for the visualisation we have developed
classdef Ship
% these are the class properties of each ship. 
   properties
      type {mustBeNumeric}
      blocks {mustBeNumeric}
      indices {mustBeNumeric}
   end
   methods
      % the constructor function for the ship class type
       function obj = Ship(t,i)
         obj.type = t;
         nums = [5,4,3,3,2];
         obj.blocks = nums(t);
         obj.indices = i;
      end
      % Every time we hit a player's ship, we subtract the number of blocks from the ship. when the ship is completely destroyed it will be 0
      function obj = Subtract(obj)
         obj.blocks = obj.blocks - 1;
      end
   end
end