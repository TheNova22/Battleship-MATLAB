function [outcome] = battleshipShotCheck(battleMatrix, rowShot, colShot)
% Outcome will tell us whether we have shot a ship of a particular type or
% if we missed

%   Shiplist contains all the ship objects of the opponent ships, which in turn each contain their respective indices.
    global shipList;
    s = size(shipList);
    shipListExists = s(1) > 0;
    outcome = 0;
    iterate = true;
    % We first check for the errors as specified in the problem statement.
    % ---------------------------------------------------------------
    [m,n] = size(battleMatrix);
    if (m ~= 10) && (n ~= 10)
        outcome = -99;
    end
    if (rowShot < 1 || rowShot > m || colShot < 1 || colShot > n )
        outcome = -97;
    end
    for i = 1:size(battleMatrix,1)
         for j = 1:size(battleMatrix,1)
            isCorrect = ismember(battleMatrix(i,j),[0 1 2 3 4 5]);
            if ~isCorrect
                outcome = -98;
                iterate = false;
                break
            end
            if iterate == false
                break
            end
        end
    end
    % ---------------------------------------------------------------

    % Note that conditions for approach 2 are checked first. for Approach 1 code, check below 

    % This is the portion for Approach 2. we go through the indices of all the opponent ships and see if we find a hit.
    % ----------------------------------------------------------------------
    if outcome == 0 % meaning no initial errors we have found
       outcome = battleMatrix(rowShot,colShot);
    end
%     this is for the visualisation we have developed. if one decides to
%     just use the function then the second if block will execute
    if outcome > 0  && shipListExists
        [~,n] = size(shipList);
        for k = 1:n
            if shipList(k).type == outcome && iterate
                for i = 1: size(shipList(k).indices,1)
                    rowi = shipList(k).indices(i,1);
                    rowj = shipList(k).indices(i,2);
                    if rowi == rowShot && rowj == colShot
                        shipList(k) = shipList(k).Subtract();
                        if shipList(k).blocks == 0
                            outcome = outcome + 100;
                        end
%                       meaning done with iteration. stop iterating.
                        iterate = false;
                    end
                end
            end
        end
    end
    % ----------------------------------------------------------------------

   

    %     iterate == True means that we did not use the initial condition.
    % This is the portion for Approach 1. we go through the matrix and check if there is no remaining ship block.
    % -------------------------------------------------------------------------------------
    if outcome > 0 && iterate
        for i = 1:size(battleMatrix,1)
            for j = 1:size(battleMatrix,1)
                if ~((colShot == j) && (rowShot == i)) && (battleMatrix(i,j) == outcome)
%                     if you found another one then stop iterating.
                    iterate = false;
                    break
                end
            if ~iterate
                break
            end
            end
        end
        if outcome > 0  && iterate == true % meaning you destroyed the last part of a ship
            outcome = outcome + 100;
        end
    end
    % -------------------------------------------------------------------------------------

end