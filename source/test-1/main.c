#include <stdio.h>
extern int somme(int a,int b);

int test_somme(int a,int b,int c){
    printf("Somme entre %i et %i :\n",a,b);
    int d =somme(a,b);
    printf("\t%i\n",d);
    if(c==d){
        printf("Ok resultat\n");
        return 0;
    }else{
        printf("Err\n");
        return -1;
    }
}

int main(){
    int test=0;
    test=test||test_somme(7,2,9);
    test=test||test_somme(7,8,15);
    test=test||test_somme(-1,2,1);
    test=test||test_somme(7,3,10);
    test=test||test_somme(7,0,7);
    test=test||test_somme(-5,2,-3);
    test=test||test_somme(-5,-7,-12);
    if(!test){
        printf("Somme OK\n");
    }else{
        printf("Somme Err\n");
    }
    return test;
    
}