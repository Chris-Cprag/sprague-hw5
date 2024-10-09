/*
This program takes in one argument which is the number
of "Hello World" statements to be printed to the 
console

Ex: helloworld 3
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  int i = 0;
  while(i<atoi(argv[1])){
    printf("Hello World\n");
    i++;
  }
  return 0;
}
