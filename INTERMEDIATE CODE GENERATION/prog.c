/*
Input
Enter a line: a+b=c*d-e/f-g-h

Output
 3AC    Triples         Quadruple
Z=c*d   (*, c, d)       (*, c, d, Z)
Y=e/f   (/, e, f)       (/, e, f, Y)
X=a+b   (+, a, b)       (+, a, b, X)
W=Z-Y   (-, Z, Y)       (-, Z, Y, W)
V=g-h   (-, g, h)       (-, g, h, V)
U=W-V   (-, W, V)       (-, W, V, U)
*/

#include <stdio.h>
#include <string.h>

char line[20];
char tempvar = 'Z';
int flag=0;

int main() {
    printf("\nEnter a line: ");
    scanf("%s", line);
    printf("\n 3AC \t Triples  \t  Quadruple\n");
    while(strlen(line) > 3){
        flag=0;
        if(!flag){
            for(int i=0; i<strlen(line); i++){
                if(line[i] == '/' || line[i] == '*'){
                    printf("%c=%c%c%c\t(%c, %c, %c)\t(%c, %c, %c, %c)\n", tempvar, line[i-1], line[i], line[i+1], line[i], line[i-1], line[i+1], line[i], line[i-1], line[i+1], tempvar);
                    line[i-1] = tempvar;
                    tempvar--;
                    
                    for(int j=i; line[j] != '\0'; j++){
                        line[j] = line[j+2];
                    }
                    
                    
                }
            }
            for(int i=0; i<strlen(line); i++){
                if(line[i] == '+' || line[i] == '-'){
                    printf("%c=%c%c%c\t(%c, %c, %c)\t(%c, %c, %c, %c)\n", tempvar, line[i-1], line[i], line[i+1], line[i], line[i-1], line[i+1], line[i], line[i-1], line[i+1], tempvar);
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
