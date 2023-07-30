#include<stdio.h>
#include<stdlib.h>

int main()
{
    system("cat in.c | grep cache= > analysis_raw.d");
    return 0;
}
