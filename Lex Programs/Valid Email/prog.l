%{
	#include <stdio.h>
	int flag = 0;
%}

%%
^[A-Za-z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ {
	flag++;
}

\n { }

%%
int main(void){
	yylex();
	if(flag == 1){
		printf("\nValid email\n\n");
	}
	else{
		printf("\nInvalid email\n\n");
	}
	
	return 0;
}
int yywrap(){
	return 1;
}
