#include <stdio.h>
extern int somme(int a,int b);


int main(){
    int a=2,b=7;
    int c=somme(a,b);
    if (c==9){
        printf("Ok resultat %i\n",c);
    }else{
        printf("Error");
    }
    
}