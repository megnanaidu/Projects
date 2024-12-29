/*partners: ellav2
Name: Megna Naidu, NetID: megnan2
this program first prompts the user to enter an index. After the user enters an index, the program
computes the row of that index, following pascal's triangle's equation
To implement this program, I first found n! because it is kept constant for every value in the row calculated 
I then implemented a series of nested loops to find k! and (n-k)! 
After finding n!, k!, and (n-k)! I plugged all the variables into the equation and outputted the final answer
After outputting the answer, I kept incrementing k and repeating the loop to output the answer for that k value.
The loop stopped once k reached n-1. 
The loop stopped before k = row because for the last value of k, a 1 is supposed to be outputted  
*/

#include <stdio.h>
#include <stdlib.h>

int main()
{
  	int row;

  	printf("Enter a row index: ");
  	scanf("%d",&row);

	unsigned long int row_count = row; //copy index value to row_count
	unsigned long int n_fact = row;

	if(row == 0)
	{
		printf("1 ");
	} 

	else {

	while(row_count > 1)
	{
		row_count -= 1; 
		n_fact *= row_count;
	}

	// n_fact not holds n!

	unsigned long int k_count = 0; // k starts at 0

	while(k_count < row)
	{
		if(k_count == 0)
		{
			printf("1 ");
			k_count++;
		}
	
		else
		{
			// calculate k! first
			unsigned long int k_fact = 1;
			unsigned long int k_loop_count = k_count; //copy the k counter to another variable
			while(k_loop_count >= 1)
			{
				k_fact *= k_loop_count;
				k_loop_count -= 1; //decrement until factorial is calculated
			}
			//at this point k_fact now holds k!

			//now calculate (n-k)!
			unsigned long int difference = row - k_count;
			unsigned long int dif_count = difference;
			unsigned long int dif_fact = 1; 
			while(dif_count > 0)
			{
				dif_fact *= dif_count;
				dif_count -= 1;
			}
			//at this point, dif_fact now holds (n-k)!

			unsigned long int answer;
			answer = (n_fact) / (k_fact * dif_fact);

			printf("%lu ", answer);
			k_count++;	
		}
	}

		printf("1"); //print 1 for last number
	
}
														
  return 0;
}
