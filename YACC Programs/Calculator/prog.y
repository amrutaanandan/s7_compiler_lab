//use gcc -o <example> y.tab.c lex.yy.c -lfl -lm
//./<example to run

//for exponents, use '^' to indicate exponent operator

%{
	#include <math.h>
	#include <stdlib.h>
	#include <stdio.h>
	int yylex(void);
	int yyerror();
	int flag = 0;
%}

%token num
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%right '^'
%%
S: E{printf("Result: %d\n", $$); return 0;};
E: E '+' E {$$=$1+$3;}|
   E '-' E {$$=$1-$3;}|
   E '*' E {$$=$1*$3;}|
   E '/' E {$$=$1/$3;}|
   E '%' E {$$=$1%$3;}|
   '('E')' {$$=$2;}   |
   E '^' E {$$=pow($1,$3);}|
   num     {$$=$1;};
%%

int main(){
	printf("\nEnter an arithmetic expression: ");
	yyparse();
}

int yyerror(){
	printf("\nNot a valid arithmetic expression!\n");
	flag=1;
}
