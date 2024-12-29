#include<stdio.h>
#include<stdlib.h>
#include<string.h>

extern const int DLEN;
extern unsigned long ihash(int num);
extern unsigned long shash(char *str);

int check_three(long seed, char *w1, char *w2, char *w3){
  int nums[3] = {-1};
  int flag = 1; 
  char *words[3]= {w1, w2, w3};

  for (int i=0; i<3; i++)
    nums[i] = rand() % DLEN;

  for (int i=0; i<3; i++)
    if (ihash(nums[i]) != shash(words[i]))
      flag = 0; 

  if (flag){
    printf("Passed passphrase check!\n");
    printf("Preparing test file.\n");
    FILE *fptr = fopen("testdata", "w");
    fprintf(fptr, "%ld\n", seed);
    
    for(int i=0; i<3; i++)
      fprintf(fptr, "%d\n", nums[i]);

    for(int i=0; i<3; i++)
      fprintf(fptr, "%s\n", words[i]);
    
    fclose(fptr);
    return 0;
  }
  else{
    printf("Failed passphrase check: %d, %d, %d\n", nums[0], nums[1], nums[2]);
    return -1;
  }
}

int main(int argc, char *argv[]){
  long seed=-1;

  if (argc!=4){
    fprintf(stderr, "Please enter exactly three arguments!\n");
    return -1;
  }


  printf("Please enter your UIN:\t");
  scanf("%ld", &seed);
  srand(seed);

  switch (argc){
    case 4:
      check_three(seed, argv[1], argv[2], argv[3]);
      break;  

    default:
      fprintf(stderr, "Please enter exactly three arguments!\n");
  }
}
