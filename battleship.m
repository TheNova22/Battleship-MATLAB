%% Introduction
% This below program is a visulatisation or a demo of Battleship portrayed
% as a game using MATLAB. Why here? Matlab offers the ability to even run
% interactive programs and applications and with that in mind, we wanted 
% to design a creative, interactive game that can be later turned into a 
% website too, hence with a proper fund, applications built on MATLAB can 
% be hosted on the internet and this simple game can be one too. For more 
% info about it, checkout WebAppCompiler.
%% Setting up the players
% We have a class called Ship and Player who's function will be to provide
% the necessary info required. These two players will be playing a game of
% battlefield against each other. 
p1 = Player('Player 1',zeros(10,10),[],0,[],[]);
p2 = Player('Player 2',zeros(10,10),[],0,[],[]);
global player;
player = p1;
global opponent;
opponent = p2;
%% Adding the ships
% if type == 0, then the player begins to insert his ships into his board
global type
type = 0;
player = p1;
seaFight('Insert the ships');
p1 = player;
player = p2;
seaFight('Insert the ships');
p2 = player;
%% Battle
% global variables are used because as in MATLAB feeding in the input 
% parameters creates a copy of the item rather than referencing it.
% placed is used because one can close the figure (top right X) without
% bombing anywhere to stop the execution.
global placed;
placed = 1;
type = 1;
while placed == 1
    placed = 0;
    player = p1;
    opponent = p2;
    seaFight('Destroy enemy ships');
    p1 = player;
    p2 = opponent;
    if placed == 0
        break;
    end
    placed = 0;
    player = p2;
    opponent = p1;
    seaFight('Destroy enemy ships');
    p2 = player;
    p1 = opponent;
    if placed == 0
        break;
    end
end
%% SEA FIGHT Function
function seaFight(text)
    global type;
    global player;
    global opponent;
    % Below are the ship details
    global ships;
    ships = {'Carrier','Battleship','Cruiser','Submarine','Destroyer'}';
    global shipSizes;
    shipSizes = {5,4,3,3,2};

    % Create UI figure
    fig = uifigure;
    fig.Position(3:4) = [900 800];

    % Create board UI component
    global uit;
    uit = uitable(fig,'ColumnWidth',{'2x','2x','2x'},'FontSize', 30);
    s = uistyle('BackgroundColor','cyan','HorizontalAlignment','center');
    addStyle(uit,s); 
    uit.Data = player.sea;
    uit.Position(3:4) = [800 550];
    uit.CellSelectionCallback = @seaCellClick;
    % Make data all zeros if its a battle, this is because the players
    % sudnt know where the opponent's ships are, they have to guess and
    % bomb to check if the ship is present in the block or not.
    if type == 1
        uit.Data = zeros(10,10);
    end
    if type == 1
        % Make the board cells yellow for hits and red for miss
        sz = size(player.hit);
        if sz(1) >= 1 
            for i = 1:sz(1)
                s2 = uistyle('BackgroundColor','yellow');
                addStyle(uit,s2,'cell',[player.hit(i,1),player.hit(i,2)]);
            end
        end
        sz = size(player.miss);
        if sz(1) >= 1
            for i = 1:sz(1)
                s2 = uistyle('BackgroundColor','red');
                addStyle(uit,s2,'cell',[player.miss(i,1),player.miss(i,2)]);
            end
        end
    end


    % UITable about who's turn it is
    info = uitable(fig,'ColumnWidth',{60}, 'ColumnName',{'Turn'});
    data = {player.name};
    info.Data = data;
    info.Position(1:4) = [50 600 100 50];
    
    % UITable about ponits of the player
    global info2;
    info2 = uitable(fig, 'ColumnName',{'Points'});
    data2 = player.points;
    info2.Data = data2;
    info2.Position(1:4) = [300 600 100 50];
    s = uistyle('HorizontalAlignment','left');
    addStyle(info2,s); 


    % UITable about basic turn info
    details = uitable(fig,'ColumnWidth',{120}, 'ColumnName',{'Info'});
    deetData = {text};
    details.Data = deetData;
    details.Position(1:4) = [20 700 150 50];
    s = uistyle('HorizontalAlignment','left');
    addStyle(details,s);

    % a variable to make sure that a player shouldn't place more than one
    % ship or bomb per turn
    global done;
    done = 0;


    if type == 0
        % UITable to select the orientation of the ship to be added
        global ax;
        ax = uitable(fig,'ColumnWidth',{50}, 'ColumnName',{'Axis'});
        global isHoriz;
        isHoriz = 1;
        axData = {'H','V'};
        ax.Data = axData';
        ax.Position(1:4) = [700 600 75 75];
        s = uistyle('HorizontalAlignment','left');
        addStyle(ax,s); 
        s2 = uistyle('BackgroundColor','green');
        addStyle(ax,s2,'cell',[1,1]);
        ax.CellSelectionCallback = @axisTableClick;
    end


    if type == 0
        % UITable to select the type of ship
        global shipTable;
        shipTable = uitable(fig,'ColumnWidth',{120}, 'ColumnName',{'Ships'});
        shipTable.Data = ships;
        shipTable.Position(1:4) = [500 620 120 150];
        
        global shipSelected;
        shipSelected = 1;
        s = uistyle('HorizontalAlignment','left');
        addStyle(shipTable,s); 
        s2 = uistyle('BackgroundColor','green');
        addStyle(shipTable,s2,'cell',[1,1]);
        shipTable.CellSelectionCallback = @shipTableClick;
    end

    uiwait(fig);
end