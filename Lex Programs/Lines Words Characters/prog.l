%{ 
	#include <stdio.h>
	int lines = 0, words = 0, characters = 0, numbers =0, spcl = 0;
%}

%%
\n { lines++; words++; }

[ \t\n]+ { words++; }

[a-zA-Z] { characters++; }

[0-9] { numbers++; }

. { spcl++; }
	
%%

int main(void){
	yylex();
	printf("\nThe number of \nlines = %d\nwords = %d\ncharacters = %d\nspecial characters = %d\nNumbers = %d\n\n", lines, words, characters, spcl, numbers);
}

int yywrap(){
	return 1;
}
