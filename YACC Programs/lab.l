%{
	#include "y.tab.h"
	#include <stdio.h>
%}
%%
do return DO;
while return WHILE;
[0-9]+ return NUM;
[A-Za-z]([A-Za-z]|[0-9])* return ID;
"<=" return LE;
">=" return GE;
"==" return EQ;
"!=" return NEQ;
"||" return OR;
"&&" return AND;
. return yytext[0];
%%

int yywrap(){
	return 1;
}
