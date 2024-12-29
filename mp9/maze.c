#include <stdio.h>
#include <stdlib.h>
#include "maze.h"
//The createMaze function reads maze dimensions and structure from a file, dynamically allocates
//memory for the maze's cells, and identifies the start and end points. The destroyMaze function frees all
//allocated memory once the maze is no longer needed, preventing memory leaks. printMaze outputs the maze
//structure. Finally, solveMazeDFS recursively explores paths within the maze, marking visited cells and
//backtracking as necessary to find a valid path from start to end.

/*
 * createMaze -- Creates and fills a maze structure from the given file
 * INPUTS:       fileName - character array containing the name of the maze file
 * OUTPUTS:      None 
 * RETURN:       A filled maze structure that represents the contents of the input file
 * SIDE EFFECTS: None
 */
maze_t * createMaze(char * fileName)
{
    

	//create a file pointer to open the file in read mode
	FILE *file = fopen(fileName, "r");

	if(file == NULL) //print error message if file can't be opened
	{
		return NULL; 
	}

	int width;
	int height;

	//read dimensions from file and store in initalized variables
	if(fscanf(file, "%d %d\n", &width, &height) != 2)
	{
		fclose(file); //if there are not 2 integers to read, close the file
		return NULL;
	}

	//allocate memory for the maze
	maze_t *maze = malloc(sizeof(maze_t));
	if(maze == NULL)
	{
		fclose(file); //if memory can't be allocated close file
		return NULL; 
	}

	//set the width and height in struct
	maze -> width = width;
	maze -> height = height;

	//allocate memory for the cells
	maze->cells = malloc(height * sizeof(char *));
	if(maze->cells == NULL)
	{
		free(maze);
		fclose(file); //if memory can't be allocated, close file
		return NULL;
	}

	for(int i = 0; i < height; i++)
	{
		maze->cells[i] = malloc(width * sizeof(char));
		if(maze->cells[i] == NULL)
		{
			for(int j = 0; j < i; j++)
			{
				free(maze->cells[j]);
			}
			free(maze->cells);
			free(maze);
			fclose(file);
			return NULL;
			//if allocation fails, close file and free memory 
		}
	}

	//loop to read each line of the maze
	for(int i = 0; i < height; i++)
	{
		for(int j = 0; j < width; j++)
		{
			maze->cells[i][j] = fgetc(file); //read a single char

			//check if it's the start or end position
			if(maze -> cells[i][j] == 'S')
			{
				maze -> startRow = i;
				maze -> startColumn = j;
			}
			else if(maze -> cells[i][j] == 'E')
			{
				maze -> endRow = i;
				maze -> endColumn = j;
			}
		}
		
		fgetc(file); //reads newline char at end of each row
	}
	
	fclose(file); //close file
	return maze; //return maze
	 
}

/*
 * destroyMaze -- Frees all memory associated with the maze structure, including the structure itself
 * INPUTS:        maze -- pointer to maze structure that contains all necessary information 
 * OUTPUTS:       None
 * RETURN:        None
 * SIDE EFFECTS:  All memory that has been allocated for the maze is freed
 */
void destroyMaze(maze_t * maze)
{
	if(maze != NULL)
	{
		for(int i = 0; i < maze->height; i++) //loop to free each row of cells
		{
			free(maze -> cells[i]);
		}

		free(maze -> cells); //free cells array
		free(maze); //free maze structure 
	}	
}

/*
 * printMaze --  Prints out the maze in a human readable format (should look like examples)
 * INPUTS:       maze -- pointer to maze structure that contains all necessary information 
 *               width -- width of the maze
 *               height -- height of the maze
 * OUTPUTS:      None
 * RETURN:       None
 * SIDE EFFECTS: Prints the maze to the console
 */
void printMaze(maze_t * maze)
{
	if(maze != NULL)
	{
		for(int i =0; i < maze->height; i++) //loop to print each char
		{
			for(int j = 0; j < maze->width; j++)
			{
				putchar(maze -> cells[i][j]);
			}
			
			putchar('\n'); //newline after each row
		}
	}

}

/*
 * solveMazeManhattanDFS -- recursively solves the maze using depth first search,
 * INPUTS:               maze -- pointer to maze structure with all necessary maze information
 *                       col -- the column of the cell currently beinging visited within the maze
 *                       row -- the row of the cell currently being visited within the maze
 * OUTPUTS:              None
 * RETURNS:              0 if the maze is unsolvable, 1 if it is solved
 * SIDE EFFECTS:         Marks maze cells as visited or part of the solution path
 */ 
int solveMazeDFS(maze_t * maze, int col, int row)
{
    // The provided gold files recursively visit neighbors in the order
    // left, up, right, down. It is okay to deviate from this if you'd 
    // like, but your outputs will be different.

	//base cases:
	if(col < 0 || col >= maze->width || row < 0 || row >= maze->height)
	{
		return 0; //when index is out of bounds, it's invalid
	}
	
	if(maze->cells[row][col] == '%' || maze->cells[row][col] == '*' || maze->cells[row][col] == '~')
	{
		return 0; //when cell is a wall or already visited, it's invalid 
	}

	if(maze->cells[row][col] == 'E')
	{
		maze -> cells [maze->startRow][maze -> startColumn] = 'S'; 
		return 1; //when end has been found
	}

	maze->cells[row][col] = '*';


	if(solveMazeDFS(maze, col - 1, row) || //move left 
	   solveMazeDFS(maze, col, row - 1) || //move up
	   solveMazeDFS(maze, col + 1, row) || //move right
	   solveMazeDFS(maze, col, row + 1))   //move down
	{

		return 1; //when any path leads to the end
	}

	//unmark cell to backtrack
        maze->cells[row][col] = '~'; //mark cells as visited, but not part of solution

	return 0; //when no solution is found
}
