%{
	#include <stdio.h>
	#include "y.tab.h"
%}

%%
for return FOR;
[A-Za-z]([A-Za-z]|[0-9])* return ID;
[0-9]+ return NUM;
"==" return EQ;
"<=" return LE;
">=" return GE;
"!=" return NEQ;
"||" return OR;
"&&" return AND;
"++" return INC;
"--" return DEC;
. return yytext[0];
%%

int yywrap(){
	return 1;
}
