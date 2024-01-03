%{
	#include <stdio.h>
	int yylex(void);
	int yyerror();
	int valid = 1;
%}

%token num op id

%%
	start: id '=' A;
	A: id B | num B |'-' num B | '(' A ')' B;
	B: op A | '-' A |;
%%

int yyerror(){
	valid = 0;
	printf("\nInvalid Expression!\n");
	return 0;
}

int main(){
	yyparse();
	if(valid){
		printf("\nValid Expression!\n");
	}
}

//input: x=a+3 valid
//input: x=(a-9 invalid
