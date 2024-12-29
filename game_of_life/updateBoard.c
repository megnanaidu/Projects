/* This program consists of three totoal functions contributing to the functionality of the Game of Life game.
 * The countLiveNeighbor functions computes the number of living neighbor cells for a given cell on a game
 * board. The updateBoard function advances the board to its next state by updating each cell based on its 
 * neighbor's statuses. Finally, the aliveStable function checks if the board has reached a stable state (no 
 * changes occurred between consecutive steps) or not. 
 *
 * countLiveNeighbor
 * Inputs:
 * board: 1-D array of the current game board. 1 represents a live cell.
 * 0 represents a dead cell
 * boardRowSize: the number of rows on the game board.
 * boardColSize: the number of cols on the game board.
 * row: the row of the cell that needs to count alive neighbors.
 * col: the col of the cell that needs to count alive neighbors.
 * Output:
 * return the number of alive neighbors. There are at most eight neighbors.
 * Pay attention for the edge and corner cells, they have less neighbors.
 */

int countLiveNeighbor(int* board, int boardRowSize, int boardColSize, int row, int col){
	//given row and column number, find that element and return the number of alive
	//neighbors that element has 

	int live_count = 0;

	for(int i=row-1; i <= row+1; i++) //check rows r-1 to r+1 given the row
	{
		for(int j=col-1; j<=col+1; j++) //checks cols c-1 to c+1
		{
			if(i==row && j==col) //check to see if loop gets to element we are checking
			{
				continue; //if yes, then don't count towards live count 
			}
			else if(i>=0 && i<boardRowSize && j>= 0 && j<boardColSize) 
			//check to make sure the neighbors(i,j) are within the bounds of the array 
			{
				//program continues if i and j are within the bounds 
				int offset = i * boardColSize + j;
				if(board[offset] == 1)
				{
					live_count++; //incement live counter only if neighbor is alive
				}
			}	
		}
	} 

	return live_count; 

}

/*
 * Update the game board to the next step.
 * Input: 
 * board: 1-D array of the current game board. 1 represents a live cell.
 * 0 represents a dead cell
 * boardRowSize: the number of rows on the game board.
 * boardColSize: the number of cols on the game board.
 * Output: board is updated with new values for next step.
 */
void updateBoard(int* board, int boardRowSize, int boardColSize) {
	//live cell stays alive if it has 2 or 3 alive neighbors
	//if live cell has more than 3 or less than 2, it dies 
	//a dead cell is brought back to life if it has exactly 3 live neighbors
	//otherwise dead cell stays dead
	//check neighbors for each element in the game, then update the board

	int tempBoard[boardRowSize * boardColSize]; //initialize a temp board

	for(int i = 0; i<boardRowSize; i++) //loop for rows
	{
		for(int j = 0; j<boardColSize; j++) //loop for columns
		{
			int live_neighbors = countLiveNeighbor(board, boardRowSize, boardColSize, i, j);
			int offset = i * boardColSize + j; 
			
			//the following case is for if the cell is alive (1)
			if(board[offset] == 1) 
			{
				if(live_neighbors == 2 || live_neighbors == 3) 
				{
					tempBoard[offset] = 1; 
				}
				
				else //case for live cell that stays alive 
				{
					tempBoard[offset] = 0; 
				}
			}

			//the following case is for if the cell is dead (0)
			else if(board[offset] == 0)
			{
				if(live_neighbors == 3) //case for dead cell coming back to life
				{
					tempBoard[offset] = 1; //cell comes to life if true, copy to temp
				}
				else //case for dead cell that stays dead
				{
					tempBoard[offset] = 0; //cell stays dead, copy to temp
				}
			}  
		
		}
	}

	//the board has now been updated, but it's in the temp_board
	//copy tempBoard over to board, so board is updated now

		for(int i = 0; i < boardRowSize; i++)
		{
			for(int j = 0; j < boardColSize; j++)
			{
				int offset = i * boardColSize + j; 
				board[offset] = tempBoard[offset]; //element in board = element in tempBoard
			} 
		} 		
}

/*
 * aliveStable
 * Checks if the alive cells stay the same for next step
 * board: 1-D array of the current game board. 1 represents a live cell.
 * 0 represents a dead cell
 * boardRowSize: the number of rows on the game board.
 * boardColSize: the number of cols on the game board.
 * Output: return 1 if the alive cells for next step is exactly the same
 * as the current step.
 * return 0 if the alive cells change for the next step.
 */ 
int aliveStable(int* board, int boardRowSize, int boardColSize){
	int stability = 1; //assume the board is stable already
	int tempBoard[boardRowSize * boardColSize]; //create a temp board 

	for(int i = 0; i < boardRowSize; i++) //copy the original board to the temp board
	{
		for(int j = 0; j < boardColSize; j++)
		{
			int offset = i * boardColSize + j;
			
			tempBoard[offset] = board[offset];
		}
	}
 

	updateBoard(tempBoard, boardRowSize, boardColSize);
	//when this function is called, tempBoard, which held the original board gets updated
	//at the end of this function call, tempBoard gets updated to hold the update board
	//board doesn't get modified because it's not a parameter 
 
	

	//compare board (updated) with tempBoard (original) and change stability accordingly
	for(int i = 0; i < boardRowSize; i++)
	{
		for(int j = 0; j < boardColSize; j++)
		{
			int offset = i * boardColSize + j;
			if(board[offset] != tempBoard[offset]) //check if element values are not equal
			{
				stability = 0; //change stability to 0 only if they are not equal
				break;
			}
		}
		if(stability == 0)
		{
			break; //break the outer loop if stability gets changed to 0
		}	
	}

	return stability;
 
}

				
