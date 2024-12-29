//partner: ellav2
//all these functions together handles sparse matrices. The load_tuples function reads matrix dimensions and 
//non-zero values from a file, creating a linked-list representation of the sparse matrix. The gv_tuples 
//function retrieves the value at a specified row and column by traversing the list to locate the entry.
//The set_tuples function adds or updates a matrix entry at a specific position, inserting or deleting nodes 
//in the list as needed. The save_tuples function writes the sparse matrix dimensions and non-zero values to 
//a file, enabling easy storage and retrieval. The add_tuples function adds two sparse matrices of the 
//same dimensions by summing their corresponding elements, creating a new matrix with the results.
//Finally, the destroy_tuples function frees the memory allocated to the matrix and all its nodes.  


#include "sparsemat.h"

#include <stdio.h>
#include <stdlib.h>

sp_tuples * load_tuples(char* input_file)
{
	FILE *fileptr = fopen(input_file, "r"); //open file in read mode
	if(!fileptr)
	{
		return NULL;
	}

	sp_tuples *matrix = malloc(sizeof(sp_tuples)); //allocate memory for matrix
	if(matrix == NULL) //make sure memory was properly allocated
	{
		fclose(fileptr);
		return NULL; 
	}

	if((fscanf(fileptr, "%d %d", &matrix->m, &matrix->n)) != 2)
	{
		fclose(fileptr);
		free(matrix); 
		return NULL;
	}
 
	
	matrix->nz = 0; //initialize number of zeros to 0
	matrix->tuples_head = NULL; //initialize head pointer to NULL

	//declare variables 
	int row;
	int col;
	double value; 

	while(fscanf(fileptr, "%d %d %lf", &row, &col, &value) == 3) //check that there are 3 values to read
	{
		set_tuples(matrix, row, col, value); //call set_tuples to set each value of matrix	
	}

	fclose(fileptr); //close file when finished
	return matrix; //return the new matrix 
		 
}


double gv_tuples(sp_tuples * mat_t,int row,int col)
{
	if(mat_t == NULL)
	{
		return 0; 
	}

	sp_tuples_node *current	= mat_t->tuples_head; 
	//create a pointer to the current node and set it equal to the head pointer 
	
	while(current != NULL) //while the current node pointer has not reached null
	{
		if(current->row == row && current->col == col)
		//check if current row and col matches the target row and col
		{
			return current->value; //return the value of the current node	
		}
		
		current = current->next; //set the node to the next node now and repeat loop until NULL
	}

	return 0; //if no match is found return 0						

}



void set_tuples(sp_tuples * mat_t, int row, int col, double value)
{
	if(mat_t == NULL)
	{
		return; 
	}


	sp_tuples_node *current = mat_t->tuples_head; //current points to the current node in matrix 
	sp_tuples_node *prev = NULL; //prev keeps track of node before current
		
	while(current != NULL && (current->row < row || (current->row == row && current->col < col)))
	//traverse through the list until we find the node, or we find where node should be inserted
	// either stopping at node with exact coordinates, or stopping just before the node with
	//correct coordinates to insert node.  
	{
		prev = current; //update the previous node pointer to point to the current node
		current = current->next; //update current node pointer to point to next node 
	}

	if(current != NULL && current->row == row && current->col == col)
	//as long as we haven't reach the end of the list, and we are at the target row and col
	{
		if(value == 0) //if value is 0, remove the node
		{
			if(prev != NULL) 
			{
				prev->next = current->next; //update the previous node pointer 
			}

			else
			{
				mat_t->tuples_head = current->next; //update 
			}

			free(current);
			mat_t->nz--;
		}

		else
		{
			current->value = value;
		}
	}

	else if(value != 0)
	{
		sp_tuples_node *new_node = malloc(sizeof(sp_tuples_node));
		if(new_node == NULL)
		{
			return; 
		}

		new_node->row = row;
		new_node->col = col;
		new_node->value = value;
		new_node->next = current; 

		if(prev != NULL)
		{
			prev->next = new_node;
		}
		
		else
		{
			mat_t->tuples_head = new_node;
		}
		
		mat_t->nz++;
	}
}



void save_tuples(char * file_name, sp_tuples * mat_t)
{

	if(mat_t == NULL)
	{
		return;
	}
	FILE *fileptr = fopen(file_name, "w"); //open the file in write mode
	if(!fileptr) //if we are unable to open the file 
	{ 
		return; 
	}
	
	fprintf(fileptr, "%d %d\n", mat_t->m, mat_t->n); //dimensions of matrix are written into file 

	sp_tuples_node *current = mat_t->tuples_head; //current keeps track of current node

	while(current) //while there are still nodes in the list, iterate through list 
	{
		fprintf(fileptr, "%d %d %lf\n", current->row, current->col, current->value);
		//row, column, and value of each node of matrix is written to file
		current = current->next; //update current node pointer for next iteration 
	}
	fclose(fileptr); //close file

}



sp_tuples * add_tuples(sp_tuples * matA, sp_tuples * matB)
{

	if(matA == NULL || matB == NULL)
	{
		return NULL; 
	}
	if((matA->m != matB->m) || (matA->n != matB->n)) 
	//if row and cols of matrix A doesn't match row and col of matrix B, then addition is not possible 
	{
		return NULL; 
	}
	
	sp_tuples *newMat = malloc(sizeof(sp_tuples)); //alocate memory for new matrix of sums
	if(newMat == NULL)
	{
		return NULL;
	}
	
	//set dimensions of new matric equal to matrix A 
    	newMat->m = matA->m; 
    	newMat->n = matA->n;

    	newMat->nz = 0; //initialize nz of new matrix to 0
    	newMat->tuples_head = NULL; //set head pointer to NULL

    	sp_tuples_node *currentA = matA->tuples_head; //keeps track of current nodes in matrix A
    	sp_tuples_node *currentB = matB->tuples_head; //keeps track of current nodes in matrix B

    	while (currentA) //while there are still nodes left in matrix A to traverse through
	{
        	set_tuples(newMat, currentA->row, currentA->col, currentA->value); //call to set new value 
        	currentA = currentA->next; //update current node pointer 
    	}

    	while (currentB) //while there are still nodes left in matrix B to traverse through
	{
        	double existing_val = gv_tuples(newMat, currentB->row, currentB->col); //get value of element
        	set_tuples(newMat, currentB->row, currentB->col, existing_val + currentB->value);
		//set value in new matrix 
        	currentB = currentB->next; //update current node in matrix B for next iteration
    	}

    	return newMat; 

}



//optionl 
sp_tuples * mult_tuples(sp_tuples * matA, sp_tuples * matB)
{ 
	return NULL;
}


	
void destroy_tuples(sp_tuples * mat_t)
{
	if(mat_t == NULL)
	{
		return; 
	}
	sp_tuples_node *current = mat_t->tuples_head; //sets current node to head of matrix 
    	while (current) //while there are nodes left in list  
	{
        	sp_tuples_node *temp = current->next; //create temp to hold next node 
        	free(current); //free the current node 
        	current = temp; //update current node to next node for next iteration  
    	}

	//after all the nodes are freed, free the matrix structure 
    	free(mat_t);	
	
}  






