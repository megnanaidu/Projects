//partner: sathvikt
//Name: Megna Naidu, NetID: megnan2
//this program takes two inputs (smallest number first) and computes all the semiprimes in the interval
//of the two numbers the user inputted. If there are none, then nothing is printed.
//there were two errors in the is_prime function. One was that the return values were switched and the other
//was that the first if statement was incorrect because it should be <= not =. in the print_semiprimes 
//function, the error was that k was k=i%j when it should be k=i/j.  

#include <stdlib.h>
#include <stdio.h>


/*
 * is_prime: determines whether the provided number is prime or not
 * Input    : a number
 * Return   : 0 if the number is not prime, else 1
 */
int is_prime(int number)
{
    int i;
    if (number <= 1) {return 0;}
    for (i = 2; i*i <= number; i++) { //for each number smaller than it
        if (number % i == 0) { //check if the remainder is 0
            return 0;
        }
    }
    return 1;
}


/*
 * print_semiprimes: prints all semiprimes in [a,b] (including a, b).
 * Input   : a, b (a should be smaller than or equal to b)
 * Return  : 0 if there is no semiprime in [a,b], else 1
 */
int print_semiprimes(int a, int b)
{
    int i, j, k;
    int ret = 0;
    for (i = a; i <=b; i++) { //for each item in interval
        //check if semiprime
        for (j = 2; j*j <= i; j++) {
            if (i%j == 0) {
		k = i/j;
                if (is_prime(j) && is_prime(k)) {
                    printf("%d ", i);
                    ret = 1;
		    break; 
                    }
                }
            }
        }

    
    printf("\n");
    return ret;

}
