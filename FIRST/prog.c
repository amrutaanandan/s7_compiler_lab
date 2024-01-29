/*
Input: 
S=Ab
A=c

Output
Enter no of productions: 2
Enter production no: 1 - S=Ab
Enter production no: 2 - A=c
FIRST OF THE GRAMMAR
(S) = {c}
(A) = {c}
*/


#include <stdio.h>
#include <ctype.h>

void first(char *result, char symbol);
void add(char *result, char c);

char symbol, productions[20][20];
int num;

int main() {
    int i, j, flag;
    char result[20];
    
    printf("\nEnter no of productions: ");
    scanf("%d", &num);
    
    for(i=0; i<num; i++){
        printf("\nEnter production no: %d - ", i+1);
        scanf("%s", productions[i]);
    }
    
    printf("\nFIRST OF THE GRAMMAR\n");
    
    for(i=0; i<num; i++){
        symbol = productions[i][0];
        first(result, symbol);
        printf("(%c) = {", symbol);
        for(j=0;result[j]!='\0'; j++){
            printf("%c", result[j]);
        }
        printf("}\n");
    }
    
    return 0;
}

void first(char *result, char symbol){
    char res[20];
    int i, j, k, epsilon=0;
    res[0]='\0';
    result[0]='\0';
    
    if(!isupper(symbol)){
        add(result, symbol);
        return;
    }
    
    for(i=0; i<num; i++){
        if(productions[i][0] == symbol){
            if(productions[i][2] == '$'){
                add(result, '$');
            }
            
            else{
                j=2;
                while(productions[i][j]!='\0'){
                    
                    epsilon=0;
                    first(res, productions[i][j]);
                        
                    for(k=0; res[k] != '\0'; k++){
                        add(result, res[k]);
                        if(res[k] == '$'){
                            epsilon=1;
                        }
                    }
                    
                    if(!epsilon){
                        break;
                    }
                    
                    j++;
                }
            }
        }
    }
    return;
}

void add(char *result, char c){
    int k;
    for(k=0; result[k]!='\0'; k++){
        if(result[k] == c){
            return;
        }
    }
    result[k++] = c;
    result[k] = '\0';
}
