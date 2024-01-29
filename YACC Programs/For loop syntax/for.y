%{
	#include <stdio.h>
	#include <stdlib.h>
	int valid=1;
	int yylex();
	int yyerror();
%}
%token ID NUM FOR EQ NEQ GE LE AND OR INC DEC
%right '='
%left OR
%left AND
%left '<' '>' LE GE EQ NEQ
%left '+' '-'
%left '*' '/'
%left INC DEC
%%
S: FOR'('CONDITION')''{'EXPR'}';
CONDITION: E';'E';'E;
E: ID'='E |
   E'+'E  |
   E'-'E  |
   E'*'E  |
   E'/'E  |
   E'<'E  |
   E'>'E  |
   E LE E |
   E GE E |
   E NEQ E |
   E OR E |
   E AND E |
   E INC |
   E DEC |
   ID | NUM;
EXPR: E | EXPR E;
   

   
%%
int yyerror(){
	printf("\nNot a valid synatx!\n");
	valid=0;
	return 0;
}

int main(){
	printf("\nEnter the expression: ");
	yyparse();
	
	if(valid){
		printf("\nValid syntax!\n");
	}
}
