%{
	#include <stdio.h>
	int vowels = 0, consonants = 0;
%}

%%
[aeiouAEIOU] {vowels ++;}
[ \t\n]+ {}
[0-9] {}
[^aeiouAEIOU] {consonants ++;}
%%

int main(void){
	yylex();
	printf("\nThe number of consonants are = %d\nThe number of vowels are = %d\n", consonants, vowels);
}

int yywrap(){
	return 1;
}
