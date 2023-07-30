#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
#include "call.h"
sem_t *mutex;
int cache = 0;
int TSX=0;
void before()
{
    if(TSX==0)
        printf("\n<N> {");
    else
    {
        printf("\n<Y> {");
        sem_wait(&mutex);
    }
}
void after()
{
    if(TSX==0)
        printf("} cache:%d\n",cache);
    else
    {
        sleep(5);
        printf("} cache:%d\n",cache);
        sem_post(&mutex);
    }
}


void *a(void* arg)
{
    TSX=getflag((char*)__func__);
    for(int i=0;i<1;i++)
    {
        printf("%s",__func__);
        cache=(int)arg;//a
    }
    return NULL;
}
void *b(void* arg)
{
    TSX=getflag((char*)(__func__));
    for(int i=0;i<1;i++)
    {
        printf("%s",__func__);
        cache=(int)arg;//b
    }
    return NULL;
}
void *c(void* arg)
{
    TSX=getflag((char*)__func__);
    for(int i=0;i<1;i++)
    {
        printf("%s",__func__);
    }
    return NULL;
}


int main()
{
    sem_open("/semaphore", O_CREAT, 0644, 1);
    
    pthread_t t1,t2,t3,t4,t5,t6;
    
    pthread_create(&t1,NULL,a,t1);
    pthread_join(t1,NULL);
    pthread_create(&t2,NULL,c,t2);
    pthread_join(t2,NULL);
    pthread_create(&t3,NULL,b,t3);
    pthread_join(t3,NULL);
    pthread_create(&t4,NULL,b,t4);
    pthread_join(t4,NULL);
    pthread_create(&t5,NULL,c,t5);
    pthread_join(t5,NULL);
    pthread_create(&t6,NULL,a,t6);
    pthread_join(t6,NULL);
    
    TSX=0;//needed for security reasons (beacuse then is no TSX redefination at the end of each fuction)
    
    sem_close(&mutex);
    sem_unlink("/semaphore");
    return 0;
}

