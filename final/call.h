#include<string.h>
#include<stdio.h>
#include<stdlib.h>
int getflag(char* str)
{
    char cmd[256];
    sprintf(cmd,"python3 write_in_flag.py %s > flag.bc",str);
    system(cmd);
    FILE* fp = fopen("./flag.bc","r");
    if(fp == NULL)
        return 1;
    int flag=0;
    fscanf(fp,"%d",&flag);
    return flag;
}
