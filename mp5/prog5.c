/*Partner NetID: sathvikt
 * In this program, I created 3 different function that control the flow of the code breaker game
 * The first function, set_seed initializes the random number generator using a seed value and prints
 * an error message if the number is invalid. The start_game function generates the solution to the game
 * by producing four random numbers between 1 and 8 for the user to guess. Lastly, the
 * make_guess function checks the users guess for correctness by comparing it to the solution
 * It caluclates how many numbers are perfect matches and how many numbers are misplaced matches for each guess
 * This function also ensures that the guess is valid and returns an error if the format is invalid
 *
 * prog5.c - source file adapted from UIUC ECE198KL Spring 2013 Program 4
 *           student code -- GOLD VERSION by Steven S. Lumetta
 */


/*
 * The functions that you must write are defined in the header file.
 * Blank function prototypes with explanatory headers are provided
 * in this file to help you get started.
 */



#include <stdio.h>
#include <stdlib.h>

#include "prog5.h"


/*
 * You will need to keep track of the solution code using file scope
 * variables as well as the guess number.
 */

static int guess_number;
static int solution1;
static int solution2;
static int solution3;
static int solution4;


/*
 * set_seed -- This function sets the seed value for pseudorandom
 * number generation based on the number the user types.
 * The input entered by the user is already stored in the string seed_str by the code in main.c.
 * This function should use the function sscanf to find the integer seed value from the 
 * string seed_str, then initialize the random number generator by calling srand with the integer
 * seed value. To be valid, exactly one integer must be entered by the user, anything else is invalid. 
 * INPUTS: seed_str -- a string (array of characters) entered by the user, containing the random seed
 * OUTPUTS: none
 * RETURN VALUE: 0 if the given string is invalid (string contains anything
 *               other than a single integer), or 1 if string is valid (contains one integer)
 * SIDE EFFECTS: initializes pseudo-random number generation using the function srand. Prints "set_seed: invalid seed\n"
 *               if string is invalid. Prints nothing if it is valid.
 */
int
set_seed (const char seed_str[])
{
   
	int seed;
	char post[2];
	int result = sscanf(seed_str, "%d%1s", &seed, post); //format specifier for string of 1 integers that 								     //represents one number 
	if(result == 1)
	{
	srand(seed);
	return 1;
	}
	else
	{
	printf("set_seed: invalid seed\n"); //invalid seed line 
	}
    
	return 0;
}


/*
 * start_game -- This function is called by main.c after set_seed but before the user makes guesses.
 *               This function creates the four solution numbers using the approach
 *               described in the wiki specification (using rand())
 *               The four solution numbers should be stored in the static variables defined above. 
 *               The values at the pointers should also be set to the solution numbers.
 *               The guess_number should be initialized to 1 (to indicate the first guess)
 * INPUTS: none
 * OUTPUTS: *one -- the first solution value (between 1 and 8)
 *          *two -- the second solution value (between 1 and 8)
 *          *three -- the third solution value (between 1 and 8)
 *          *four -- the fourth solution value (between 1 and 8)
 * RETURN VALUE: none
 * SIDE EFFECTS: records the solution in the static solution variables for use by make_guess, set guess_number
 */
void
start_game (int* one, int* two, int* three, int* four)
{
    //your code here
	//generates a number 1-8 for each digit value 
	*one = (rand() % 8) + 1; 
	*two = (rand() % 8) + 1; 
	*three = (rand() % 8) + 1; 
	*four = (rand() % 8) + 1; 

	//assigns the corresponding digit values to solution variables 
	solution1 = *one;
    	solution2 = *two;
    	solution3 = *three;
    	solution4 = *four;

	guess_number = 1; 
}

/*
 * make_guess -- This function is called by main.c after the user types in a guess.
 *               The guess is stored in the string guess_str. 
 *               The function must calculate the number of perfect and misplaced matches
 *               for a guess, given the solution recorded earlier by start_game
 *               The guess must be valid (contain only 4 integers, within the range 1-8). If it is valid
 *               the number of correct and incorrect matches should be printed, using the following format
 *               "With guess %d, you got %d perfect matches and %d misplaced matches.\n"
 *               If valid, the guess_number should be incremented.
 *               If invalid, the error message "make_guess: invalid guess\n" should be printed and 0 returned.
 *               For an invalid guess, the guess_number is not incremented.
 * INPUTS: guess_str -- a string consisting of the guess typed by the user
 * OUTPUTS: the following are only valid if the function returns 1 (A valid guess)
 *          *one -- the first guess value (between 1 and 8)
 *          *two -- the second guess value (between 1 and 8)
 *          *three -- the third guess value (between 1 and 8)
 *          *four -- the fourth color value (between 1 and 8)
 * RETURN VALUE: 1 if the guess string is valid (the guess contains exactly four
 *               numbers between 1 and 8), or 0 if it is invalid
 * SIDE EFFECTS: prints (using printf) the number of matches found and increments guess_number(valid guess) 
 *               or an error message (invalid guess)
 *               (NOTE: the output format MUST MATCH EXACTLY, check the wiki writeup)
 */
int
make_guess (const char guess_str[], int* one, int* two, int* three, int* four)
{

	char post[2];
	int perfect_num = 0;
	int misplaced_num = 0;
	int w, x, y, z;

	int result = sscanf(guess_str, "%d%d%d%d%1s", &w, &x, &y, &z, post); //puts together a string of 4 digits
	
	if(result!=4 || w<1 || w>8 || x<1 || x>8 || y<1 || y>8 || z<1 || z>8 )
	{
	printf("make_guess: invalid guess\n");
	return 0;
	}

	//at this point, we know the user entered all 4 digits
	//assign guessed values to the corresponding pointers
	*one = w;
	*two = x;
	*three = y;
	*four = z;

	int solution_used[4] = {0,0,0,0}; //check if solution has been paired
	int guess_used[4] = {0,0,0,0}; //check if a guess number has been paired 

	//store the guess and solution values in arrays
	int guess[4] = {w, x, y, z};
	int solution[4] = {solution1, solution2, solution3, solution4};

	//find the number of perfect matches in the guess
	for(int i=0; i<4; i++)
	{

		if(guess[i] == solution[i]) 
		{
		perfect_num++; 
		guess_used[i] = 1;
		solution_used[i] = 1;
		}

	}

	//find the number of misplaced matches in the guess
	for(int i=0; i<4; i++)
	{
		if(guess_used[i]) continue; //skip if already paired as a perfect match
		for(int j = 0; j<4; j++)
		{
			if(i!=j && !solution_used[j] && guess[i] == solution[j])
			{
			misplaced_num++;
			solution_used[j] = 1;
			break;
			}
		}
	}

	//print the result 
	printf("With guess %d, you got %d perfect matches and %d misplaced matches.\n", guess_number, perfect_num, misplaced_num);

	//increment the guess number
	guess_number++;
	
//  One thing you will need to read four integers from the string guess_str, using a process
//  similar to set_seed
//  The statement, given char post[2]; and four integers w,x,y,z,
//  sscanf (guess_str, "%d%d%d%d%1s", &w, &x, &y, &z, post)
//  will read four integers from guess_str into the integers and read anything else present into post
//  The return value of sscanf indicates the number of items sucessfully read from the string.
//  You should check that exactly four integers were sucessfully read.
//  You should then check if the 4 integers are between 1-8. If so, it is a valid guess
//  Otherwise, it is invalid.  
//  Feel free to use this sscanf statement, delete these comments, and modify the return statement as needed
    return 1;
}


