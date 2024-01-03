%{
	#include <stdio.h>
	int yylex(void);
	int yyerror();
	int valid = 1;
%}

%token digit letter

%%
	S: letter A;
	A: letter A | digit A | ;
%%

int yyerror(){
	valid = 0;
	printf("\nNot an identifier!\n");
	return 0;
}

int main(void){
	yyparse();
	printf("\nEnter an identifier name: ");
	if(valid){
		printf("\nIs a valid identifier!\n");
	}
}
