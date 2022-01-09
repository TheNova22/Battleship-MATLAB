# Battleship-MATLAB
This repository is a simulation created using MATLAB in 40 hours for a hackathon.

## About
We have to create a battleship game which is known to be played by two player on a 10x10 board. They can place ships of 5 types which are *Carrier*,*Battleship*,*Cruiser*,*Submarine* and *Destroyer* whose length are *5*,*4*,*3*,*3*,*2* respectively.
After placing the ships, they get to bomb a square according their choice while not knowing the opponent's ship position. If they succeed, they earn the respective points, else they just miss and hit water. If they hit a complete ship, they shall be awarded extra 100 points too.

## Approach
This approach involves not only a function, but also simulation with UITables, user intractability and providing them the ability to play and get to know how the game really works. </br>
This method allows users to play the game against another by running the main file which is titled as battleship.m.

### Assumptions
- Ships cannot overlap one another when a player adds them on the board.
- The ships follow the following allotment : types [1,2,3,4,5] with lengths [5,4,3,3,2] respectively.
- The board will be of 10x10 size.

### Procedure
- This process takes advantage of MATLAB being an OOP-language. Creating classes for each player and their ships provides us the right details to extract data to implement and integrate when needed.
- Using the concept of global variables becomes a key role here as there are multiple tables here to be used and a single common function would prove bad for documentation and readability.
- As each ship is added, we store a reference of that ship to that player, and record the values of the indices and the points of the ship being added. 
- This approach aids us when the battle begins, where the goal is to eliminate the necessary blocks. Here it happens quickly because of object parameters thereby reducing the number of iterations as opposed to the first approach.

#### The process of ship creation depends on three selected values
- The type of ship, through which the size of the ship is also determined.
- The axis or orientation of the ship.
- The location and surrounding of the selected cell.
  - The ship shouldn’t cross across either side of the board.
  - Another ship can’t be placed on an already existing ship.
  - Two ships shouldn’t be allowed to overlap.


#### The process of bombing depends on
- State of the cell that is being bombed upon
- If the cell that is being bombed is not a ship, it is counted as a miss
- If the cell that is being bombed is a part of a ship, points are awarded as per conditions and the alloted points.
- If the cell that is being bombed has already been bombed before, the turn isn’t considered.


Hence, whenever a player attempts to attack their opponent’s board, we call the battleshipShotCheck function.
- The algorithm first checks if the inputs are improper and if they are, it prompts a certain error code (-99,-98,-97).
- It stores the indices of the block which is being fired in a variable, which can be referenced and used throughout the process. Let’s call this variable as *V* which is located at *(r,c)*.
- We then iterate through the indices of the opponent’s ships, and check if their indices match with *V*.
- If there is a match, then it means that the player has successfully hit a ship, hence the count of that ship will be deducted from its set value.
- If the count of that ship reaches 0, that means the ship is destroyed completely. We award 100 more points along with the points allotted for one part of the ship being destroyed.
- If it is not zero, then the whole ship isn’t destroyed and hence the awarded points are for one part of the ship being destroyed.

### How to play
- One can start a game by running the battleship.m file.in matlab. On doing so, An empty board will appear, which can be filled with ships of various types by player 1. Once player 1 finishes placing their ships, They must close the board window, after which another empty grid will appear for player 2.
- After both players fill their boards respectively, the game will start. A player can attempt attacking one block on the board by clicking on the desired block. on doing so:
- The block will turn red if it does not hit anything.
- The block will turn yellow if it hits a ship
- Turns will alternate from one player to another, and a player has to close the window to indicate their move has been completed.
- Note that if the player does not make a move, and closes the window, it is assumed that the players want to stop playing and the game stops running.

### Simulation Results
![screenshot 1](https://github.com/TheNova22/Battleship-MATLAB/blob/main/screenshots/s1.png)
![screenshot 2](https://github.com/TheNova22/Battleship-MATLAB/blob/main/screenshots/s2.png)
![screenshot 3](https://github.com/TheNova22/Battleship-MATLAB/blob/main/screenshots/s3.png)
![screenshot 4](https://github.com/TheNova22/Battleship-MATLAB/blob/main/screenshots/s4.png)
![screenshot 5](https://github.com/TheNova22/Battleship-MATLAB/blob/main/screenshots/s5.png)
![screenshot 6](https://github.com/TheNova22/Battleship-MATLAB/blob/main/screenshots/s6.png)
