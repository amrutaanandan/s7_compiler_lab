%{
	#include "y.tab.h"
	extern int yyval;
%}

%%
[0-9]+ {yylval = atoi(yytext); return num;}
. {return yytext[0];}
\n {return 0;}

%%

int yywrap(){
	return 1;
}
