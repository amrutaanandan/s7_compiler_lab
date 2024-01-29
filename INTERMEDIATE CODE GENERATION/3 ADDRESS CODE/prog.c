#include <stdio.h>
#include <string.h>

char line[20];
char tempvar = 'Z';
int flag=0;

int main() {
    printf("\nEnter a line: ");
    scanf("%s", line);
    
    while(strlen(line) > 3){
        flag=0;
        if(!flag){
            for(int i=0; i<strlen(line); i++){
                if(line[i] == '/' || line[i] == '*'){
                    printf("%c=%c%c%c\n", tempvar, line[i-1], line[i], line[i+1]);
                    line[i-1] = tempvar;
                    tempvar--;
                    
                    for(int j=i; line[j] != '\0'; j++){
                        line[j] = line[j+2];
                    }
                    
                    
                }
            }
            for(int i=0; i<strlen(line); i++){
                if(line[i] == '+' || line[i] == '-'){
                    printf("%c=%c%c%c\n", tempvar, line[i-1], line[i], line[i+1]);
                    line[i-1] = tempvar;
                    tempvar--;
                    
                    for(int j=i; line[j] != '\0'; j++){
                        line[j] = line[j+2];
                    }
                    
                    
                }
            }
        }
            
        
    }

    return 0;
}
