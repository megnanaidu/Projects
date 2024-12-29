#include "acc.h"
#include <pthread.h>

int main() {
    unsigned long long ret = 0;

    // Holds pthread_t's for all generated threads
    pthread_t threads[NUM_THREADS];

    // Holds thread id's for all generated threads
    int thread_args[NUM_THREADS];

    // Temporary thread_id for looping purposes
    int thread_id;

    // Loop to create NUM_THREADS threads with pthread_create (Your code goes here)

    

    // Wait for all threads to complete and join them (Your code goes here)



    // Write the calculated result to parallel_output.txt
    FILE *out = fopen("parallel_output.txt", "w");
    fprintf(out, "%llu\n", ret);
    fclose(out);
    
    return 0;
}