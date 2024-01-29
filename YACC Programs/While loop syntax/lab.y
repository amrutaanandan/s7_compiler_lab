%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	int yyerror();
	int valid=1;
	
%}

%token DO WHILE NUM ID LE GE EQ NEQ OR AND
%right '='
%left OR
%left AND
%left '<' '>' LE GE EQ NEQ
%left '+' '-'
%left '*' '/'
%%
S: DO'{'STMT'}'WHILE'('EXPR')'';' ;
STMT: E |STMT E;
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
   ID | NUM;
   
EXPR: E'<'E |
	  E'>'E |
	  E LE E |
	  E GE E |
	  E EQ E |
	  E NEQ E |
	  E OR E |
	  E AND E |
	  ID | NUM;

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
