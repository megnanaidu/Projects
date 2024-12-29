//partners: talapin2, ianchan2
#include "game.h"
/*The provided code implements a simplified version of the 2048 game
with dynamic memory allocation for a customizable grid size. It includes functions to create,
reset, and destroy the game, manage tile movements in four directions (w, a, s, d), merge tiles, and
generate random new tiles. The game keeps track of the score as tiles merge, and checks for legal moves to
determine when the game ends. The code handles user input, providing a simple terminal-based interface for
interacting with the game.*/

game * make_game(int rows, int cols)
/*! Create an instance of a game structure with the given number of rows
    and columns, initializing elements to -1 and return a pointer
    to it. (See game.h for the specification for the game data structure) 
    The needed memory should be dynamically allocated with the malloc family
    of functions.
*/
{
    //Dynamically allocate memory for game and cells (DO NOT modify this)
    game * mygame = malloc(sizeof(game));
    mygame->cells = malloc(rows*cols*sizeof(cell));

    //YOUR CODE STARTS HERE:  Initialize all other variables in game struct

    mygame->rows = rows; // will set the row value in teh struct to the value entered
    mygame->cols = cols; // will set the col value in teh struct to the value entered
    mygame->score = 0; // will set the score to zero in the struct


    for(int i = 0; i < rows*cols; i++) // will generate the empty-board
    {
        mygame->cells[i] = -1;
    }

    return mygame;
}

void remake_game(game ** _cur_game_ptr,int new_rows,int new_cols)
/*! Given a game structure that is passed by reference, change the
	game structure to have the given number of rows and columns. Initialize
	the score and all elements in the cells to -1. Make sure that any 
	memory previously allocated is not lost in this function.	
*/
{
	/*Frees dynamically allocated memory used by cells in previous game,
	 then dynamically allocates memory for cells in new game.  DO NOT MODIFY.*/
	free((*_cur_game_ptr)->cells);
	(*_cur_game_ptr)->cells = malloc(new_rows*new_cols*sizeof(cell));

	 //YOUR CODE STARTS HERE:  Re-initialize all other variables in game struct

     (*_cur_game_ptr)->rows = new_rows; // will set the row value in teh struct to the value entered
     (*_cur_game_ptr)->cols = new_cols; // will set the col value in the struct to the value entered
     (*_cur_game_ptr)->score = 0; // will set the score to zero


     for(int i = 0; i < new_rows*new_cols; i++) // makes the empty board
     {
        (*_cur_game_ptr)->cells[i] = -1;
     }


	return;	
}

void destroy_game(game * cur_game)
/*! Deallocate any memory acquired with malloc associated with the given game instance.
    This includes any substructures the game data structure contains. Do not modify this function.*/
{
    free(cur_game->cells);
    free(cur_game);
    cur_game = NULL;
    return;
}

cell * get_cell(game * cur_game, int row, int col)
/*! Given a game, a row, and a column, return a pointer to the corresponding
    cell on the game. (See game.h for game data structure specification)
    This function should be handy for accessing game cells. Return NULL
	if the row and col coordinates do not exist.
*/
{
    //YOUR CODE STARTS HERE
	
    if((row >= 0 && row < cur_game->rows) && (col >= 0 && col < cur_game->cols)) // checks valid cell
    {
        return &cur_game->cells[row*cur_game->cols + col]; // returns address of cells
    }

    return NULL;
}

int move_w(game * cur_game)
/*!Slides all of the tiles in cur_game upwards. If a tile matches with the 
   one above it, the tiles are merged by adding their values together. When
   tiles merge, increase the score by the value of the new tile. A tile can 
   not merge twice in one turn. If sliding the tiles up does not cause any 
   cell to change value, w is an invalid move and return 0. Otherwise, return 1. 
*/
{
    //YOUR CODE STARTS HERE
    int rows = cur_game->rows; // will intialize everything to values from the structs
    int cols = cur_game->cols;
    int flag = 0; // will set the move complete flag to false

	for(int i = 0; i < rows; i++) // will loop through every element to chekc if we can move up
        {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j); // gets the adress value inside of the cell
           
            if(*curr_cell != -1) // checks if it in empty
            {
                for(int k = 0; k < i; k++)
                {
                    if(*get_cell(cur_game, k, j) == -1)
                    {
                        *get_cell(cur_game, k, j) = *curr_cell; // move it by moving and replacing
                        *curr_cell = -1;
                        flag = 1;
                    }
                }
            }
        }
    }


    for(int i = 0; i < rows; i++) // goes through every element
    {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j); // gets the value of the element
           
            if(i == 0)
            {
                continue; // if top row then we will skip
            }


            if(*curr_cell == *get_cell(cur_game, i - 1, j) && !(*curr_cell == -1)) // will check if we can merge and if we can we will merge
            {



	  *get_cell(cur_game, i - 1, j) += *curr_cell;
                cur_game->score += (*curr_cell * 2);
                *curr_cell = -1;
                flag = 1;
            }
        }
    }


    for(int i = 0; i < rows; i++) // same as the top loop
    {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(*curr_cell != -1)
            {
                for(int k = 0; k < i; k++)
                {
                    if(*get_cell(cur_game, k, j) == -1)
                    {
                        *get_cell(cur_game, k, j) = *curr_cell;
                        *curr_cell = -1;
                        flag = 1;
                    }
                }
            }
        }
    }


    return flag;

};

int move_s(game * cur_game) //slide down
{
    //YOUR CODE STARTS HERE
	 int rows = cur_game->rows;
    int cols = cur_game->cols;
    int flag = 0;

	for(int i = rows - 1; i > -1; i--)
    {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(*curr_cell != -1)
            {
                for(int k = rows - 1; k > i; k--)
                {
                    if(*get_cell(cur_game, k, j) == -1)
                    {
                        *get_cell(cur_game, k, j) = *curr_cell;
                        *curr_cell = -1;
                        flag = 1;
                    }
                }
            }
        }
    }


    for(int i = rows - 1; i > -1; i--)
    {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(i == rows - 1)
            {
                continue;
            }


            if(*curr_cell == *get_cell(cur_game, i + 1, j) && !(*curr_cell == -1))
            {
                *get_cell(cur_game, i + 1, j) += *curr_cell;
                cur_game->score += (*curr_cell * 2);
                *curr_cell = -1;
                flag = 1;

 }
        }
    }


    for(int i = rows - 1 ; i > -1; i--)
    {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(*curr_cell != -1)
            {
                for(int k = rows - 1; k > i; k--)
                {
                    if(*get_cell(cur_game, k, j) == -1)
                    {
                        *get_cell(cur_game, k, j) = *curr_cell;
                        *curr_cell = -1;
                        flag = 1;
                    }
                }
            }
        }
    }


    return flag;
    
};

int move_a(game * cur_game) //slide left
{
    //YOUR CODE STARTS HERE
    int rows = cur_game->rows;
    int cols = cur_game->cols;
    int flag = 0;


    for(int i = 0; i < rows; i++)
    {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j);

	if(*curr_cell != -1)
            {
                for(int k = 0; k < j; k++)
                {
                    if(*get_cell(cur_game, i, k) == -1)
                    {
                        *get_cell(cur_game, i, k) = *curr_cell;
                        *curr_cell = -1;
                        flag = 1;
                    }
                }
            }
        }
    }


    for(int i = 0; i < rows; i++)
    {
        for(int j = 0; j < cols; j++)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(j == 0)
            {
                continue;
            }


            if(*curr_cell == *get_cell(cur_game, i, j - 1) && !(*curr_cell == -1))
            {
                *get_cell(cur_game, i, j-1) += *curr_cell;
                cur_game->score += (*curr_cell * 2);
                *curr_cell = -1;
                flag = 1;
            }
        }
    }


    for(int i = 0; i < rows; i++)
    {
        for(int j = 0; j < cols; j++)
		{
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(*curr_cell != -1)
            {
                for(int k = 0; k < j; k++)
                {
                    if(*get_cell(cur_game, i, k) == -1)
                    {
                        *get_cell(cur_game, i, k) = *curr_cell;
                        *curr_cell = -1;
                        flag = 1;
                    }
                }
            }
        }
    }


    return flag;


    
};

int move_d(game * cur_game){ //slide to the right
    //YOUR CODE STARTS HERE
	int rows = cur_game->rows;
    int cols = cur_game->cols;
    int flag = 0;


    for(int i = 0; i < rows; i++)
    {
        for(int j = cols - 1; j > -1; j--)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(*curr_cell != -1)
            {
                for(int k = cols - 1; k > j; k--)
                {
                    if(*get_cell(cur_game, i, k) == -1)
                    {
                        *get_cell(cur_game, i, k) = *curr_cell;
                        *curr_cell = -1;

			 flag = 1;
                    }
                }
            }
        }
    }


    for(int i = 0; i < rows; i++)
    {
        for(int j = cols - 1; j > -1; j--)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(j == cols - 1)
            {
                continue;
            }


            if(*curr_cell == *get_cell(cur_game, i, j + 1) && !(*curr_cell == -1))
            {
                *get_cell(cur_game, i, j+1) += *curr_cell;
                cur_game->score += (*curr_cell * 2);
                *curr_cell = -1;
                flag = 1;
            }
        }
    }


    for(int i = 0; i < rows; i++)
    {
        for(int j = cols - 1; j > -1; j--)
        {
            cell * curr_cell = get_cell(cur_game, i, j);
           
            if(*curr_cell != -1)
            {
                for(int k = cols - 1; k > j; k--)
                {
                    if(*get_cell(cur_game, i, k) == -1)

		{
                        *get_cell(cur_game, i, k) = *curr_cell;
                        *curr_cell = -1;
                        flag = 1;
                    }
                }
            }
        }
    }


    return flag;

   
};

int legal_move_check(game * cur_game)
/*! Given the current game check if there are any legal moves on the board. There are
    no legal moves if sliding in any direction will not cause the game to change.
	Return 1 if there are possible legal moves, 0 if there are none.
 */
{
    //YOUR CODE STARTS HERE

	for(int i = 0; i < cur_game->cols * cur_game->rows; i++) // if there is an empty space then we can move
    {
        if(cur_game->cells[i] == -1)
        {
            return 1;
        }
    }
    /* will go through every element and check if there is the same value right next to it
    if so then we can merge so we will have a move that we can do*/
    for(int i = 0; i < cur_game->rows; i++)
    {
        for(int j = 0; j < cur_game->cols; j++)
        {
            cell * cur_cell = get_cell(cur_game, i, j);

		if((j+1 < cur_game->cols) && (*cur_cell == *get_cell(cur_game, i, j+1)))
            {
                return 1;
            }


            if((i+1 < cur_game->rows) && (*cur_cell == *get_cell(cur_game, i+1, j)))
            {
                return 1;
            }
        }
    }


    return 0;


    
}


/*! code below is provided and should not be changed */

void rand_new_tile(game * cur_game)
/*! insert a new tile into a random empty cell. First call rand()%(rows*cols) to get a random value between 0 and (rows*cols)-1.
*/
{
	
	cell * cell_ptr;
    cell_ptr = 	cur_game->cells;
	
    if (cell_ptr == NULL){ 	
        printf("Bad Cell Pointer.\n");
        exit(0);
    }
	
	
	//check for an empty cell
	int emptycheck = 0;
	int i;
	
	for(i = 0; i < ((cur_game->rows)*(cur_game->cols)); i++){
		if ((*cell_ptr) == -1){
				emptycheck = 1;
				break;
		}		
        cell_ptr += 1;
	}
	if (emptycheck == 0){
		printf("Error: Trying to insert into no a board with no empty cell. The function rand_new_tile() should only be called after tiles have succesfully moved, meaning there should be at least 1 open spot.\n");
		exit(0);
	}
	
    int ind,row,col;
	int num;
    do{
		ind = rand()%((cur_game->rows)*(cur_game->cols));
		col = ind%(cur_game->cols);
		row = ind/cur_game->cols;
    } while ( *get_cell(cur_game, row, col) != -1);
        //*get_cell(cur_game, row, col) = 2;
	num = rand()%20;
	if(num <= 1){
		*get_cell(cur_game, row, col) = 4; // 1/10th chance
	}
	else{
		*get_cell(cur_game, row, col) = 2;// 9/10th chance
	}
}

int print_game(game * cur_game) 
{
    cell * cell_ptr;
    cell_ptr = 	cur_game->cells;

    int rows = cur_game->rows;
    int cols = cur_game->cols;
    int i,j;
	
	printf("\n\n\nscore:%d\n",cur_game->score); 
	
	
	printf("\u2554"); // topleft box char
	for(i = 0; i < cols*5;i++)
		printf("\u2550"); // top box char
	printf("\u2557\n"); //top right char 
	
	
    for(i = 0; i < rows; i++){
		printf("\u2551"); // side box char
        for(j = 0; j < cols; j++){
            if ((*cell_ptr) == -1 ) { //print asterisks
                printf(" **  "); 
            }
            else {
                switch( *cell_ptr ){ //print colored text
                    case 2:
                        printf("\x1b[1;31m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 4:
                        printf("\x1b[1;32m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 8:
                        printf("\x1b[1;33m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 16:
                        printf("\x1b[1;34m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 32:
                        printf("\x1b[1;35m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 64:
                        printf("\x1b[1;36m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 128:
                        printf("\x1b[31m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 256:
                        printf("\x1b[32m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 512:
                        printf("\x1b[33m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 1024:
                        printf("\x1b[34m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 2048:
                        printf("\x1b[35m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 4096:
                        printf("\x1b[36m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 8192:
                        printf("\x1b[31m%04d\x1b[0m ",(*cell_ptr));
                        break;
					default:
						printf("  X  ");

                }

            }
            cell_ptr++;
        }
	printf("\u2551\n"); //print right wall and newline
    }
	
	printf("\u255A"); // print bottom left char
	for(i = 0; i < cols*5;i++)
		printf("\u2550"); // bottom char
	printf("\u255D\n"); //bottom right char
	
    return 0;
}

int process_turn(const char input_char, game* cur_game) //returns 1 if legal move is possible after input is processed
{ 
	int rows,cols;
	char buf[200];
	char garbage[2];
    int move_success = 0;
	
    switch ( input_char ) {
    case 'w':
        move_success = move_w(cur_game);
        break;
    case 'a':
        move_success = move_a(cur_game);
        break;
    case 's':
        move_success = move_s(cur_game);
        break;
    case 'd':
        move_success = move_d(cur_game);
        break;
    case 'q':
        destroy_game(cur_game);
        printf("\nQuitting..\n");
        return 0;
        break;
	case 'n':
		//get row and col input for new game
		dim_prompt: printf("NEW GAME: Enter dimensions (rows columns):");
		while (NULL == fgets(buf,200,stdin)) {
			printf("\nProgram Terminated.\n");
			return 0;
		}
		
		if (2 != sscanf(buf,"%d%d%1s",&rows,&cols,garbage) ||
		rows < 0 || cols < 0){
			printf("Invalid dimensions.\n");
			goto dim_prompt;
		} 
		
		remake_game(&cur_game,rows,cols);
		
		move_success = 1;
		
    default: //any other input
        printf("Invalid Input. Valid inputs are: w, a, s, d, q, n.\n");
    }

	
	
	
    if(move_success == 1){ //if movement happened, insert new tile and print the game.
         rand_new_tile(cur_game); 
		 print_game(cur_game);
    } 

    if( legal_move_check(cur_game) == 0){  //check if the newly spawned tile results in game over.
        printf("Game Over!\n");
        return 0;
    }
    return 1;
}
 

