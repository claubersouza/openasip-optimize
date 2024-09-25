#include<stdio.h>


int main() {

    int n = 10;
    int a = 0 , b =1;

    for (int i = 2 ; i < n ; i++) {
       int temp = a + b;
       a = b;
       b = temp;
      printf(" %d",b);
    }
    printf("\n");

    return 0;
}