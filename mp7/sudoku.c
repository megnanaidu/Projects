//partner NetID: ellav2
//This program consists of various functions that come together to solve a given sudoku puzzle
//the is_val_in_row function, is_val_in_col function, and is_val_in_3x3_zone checks if each value meets the 
//constraints of the game. If none of the conditions are met (value doesn't already exist in the row, column,
//or the 3x3 grid), then it's a valid value to place in the cell. The solve_sudoku function uses a recursive
//backtracking algorithm to fill the grid my attempting to place valid numbers in empty cells, if placing a 
//number leads to an unsolveable state, then the program backtracks by resetting the cell and trying the next
//posssible value. This process continues until the puzzle is solved. 

#include "sudoku.h"

//-------------------------------------------------------------------------------------------------
// Start here to work on your MP7
//-------------------------------------------------------------------------------------------------

// You are free to declare any private functions if needed.

// Function: is_val_in_row
// Return true if "val" already existed in ith row of array sudoku.
int is_val_in_row(const int val, const int i, const int sudoku[9][9]) {

  assert(i>=0 && i<9); //checks first that row index i is valid
		       

//the row index is given as i 
//we have to iterate through every solumn index given row i and check for the value 
  // BEG TODO
	for(int j = 0; j <= 8; j++)
	{
		if(sudoku[i][j] == val)
		{
			return 1;
		}
	}
  
  return 0;
  // END TODO
}

// Function: is_val_in_col
// Return true if "val" already existed in jth column of array sudoku.
int is_val_in_col(const int val, const int j, const int sudoku[9][9]) {

  assert(j>=0 && j<9); //checks that column index is valid

//given column index j, we have to iterate through all the row indexes to see if value is in column

  // BEG TODO
	for(int i = 0; i <= 8; i++)
	{
		if(sudoku[i][j] == val)
		{
			return 1;
		}
	}
  
  return 0;
  // END TODO
}

// Function: is_val_in_3x3_zone
// Return true if val already existed in the 3x3 zone corresponding to (i, j)
int is_val_in_3x3_zone(const int val, const int i, const int j, const int sudoku[9][9]) {
   
  assert(i>=0 && i<9);
  
  // BEG TODO

	//given i and j, find the top left element of the zone i and j are in
	int top_left_i = (i/3)*3;
	int top_left_j = (j/3)*3;

	for(int row = top_left_i; row <= top_left_i + 2; row++)
	{
		for(int col = top_left_j; col <= top_left_j + 2; col++)
		{
			if(sudoku[row][col] == val)
			return 1;
		}
	}

  return 0;
  // END TODO
}

// Function: is_val_valid
// Return true if the val is can be filled in the given entry.
int is_val_valid(const int val, const int i, const int j, const int sudoku[9][9]) {

  assert(i>=0 && i<9 && j>=0 && j<9);

 	if(is_val_in_row(val, i, sudoku) == 1)
	return 0;
	//if the value is in the rwo 1 is returned, val can't be filled in

	if(is_val_in_col(val, j, sudoku) == 1)
	return 0;

	if(is_val_in_3x3_zone(val, i, j, sudoku))
	return 0;

 //if none of the condition are met making val invalid, then val can be filled, true is returned
  return 1;
  // END TODO
}

// Procedure: solve_sudoku
// Solve the given sudoku instance.
int solve_sudoku(int sudoku[9][9]) {

  // BEG TODO.

	//iterate through each cell to see which is empty to place a number there
	for(int i = 0; i < 9; i++)
	{
		for(int j = 0; j < 9; j++)
		{

			if(sudoku[i][j] == 0) //checks if cell is empty
			{
				for(int num = 1; num <= 9; num++) //iterate through numbers 1-9
				{
					if(is_val_valid(num, i, j, sudoku) == 1)
					{
						sudoku[i][j] = num; //place number in cell if valid

						//recursively attemot to solve rest of the grid
						if(solve_sudoku(sudoku) == 1)
						return 1; //puzzle is solved

						else
						sudoku[i][j] = 0;
						//if the puzzle wasn't solved, reset the cell. 
					}

	
				}
					return 0; //if no number can be placed returns false to backtrack
					//everytime we return 0 we backtrack a step. 
			}
		}
	}

	return 1; //puzzle is solved if all cells are filled 

  // END TODO.
}

// Procedure: print_sudoku
void print_sudoku(int sudoku[9][9])
{
  int i, j;
  for(i=0; i<9; i++) {
    for(j=0; j<9; j++) {
      printf("%2d", sudoku[i][j]);
    }
    printf("\n");
  }
}

// Procedure: parse_sudoku
void parse_sudoku(const char fpath[], int sudoku[9][9]) {
  FILE *reader = fopen(fpath, "r");
  assert(reader != NULL);
  int i, j;
  for(i=0; i<9; i++) {
    for(j=0; j<9; j++) {
      fscanf(reader, "%d", &sudoku[i][j]);
    }
  }
  fclose(reader);
}

