#include <stdio.h>
extern int pgcd(int a,int b);

int test_pgcd(int a,int b,int c){

    printf("PGCD %i et %i\n",a,b);
    int d=pgcd(a,b);
    printf("\t%i\n",d);
    if(c==d){
        printf("Résultat Ok");
        return 0;
    }else{
        printf("Résultat Err");
        return -1;
    }
}

int main(){
    int test=0;
    printf("Lancement test pgcd\n");
    test=test||test_pgcd(12,10,2);
    test=test||test_pgcd(12,15,3);
    test=test||test_pgcd(12,12,12);
    test=test||test_pgcd(8,10,2);
    if(!test){
        printf("PGCD OK\n");
    }else{
        printf("PGCD Err\n");
    }

    



    return test;


}