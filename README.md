# s7_compiler_lab
Programs done as part of the S7 compiler lab course

Compiling and running lex files:
```
flex <filename.l>
gcc lex.yy.c -lfl
./a.out
```
Adding input files:
```
flex <filename.l>
gcc lex.yy.c -lfl
./a.out < <filename.txt>
```
Compiling and running yacc files:
```
yacc -d <filename.y>
flex <filename.l>
gcc -o <examplefile> y.tab.c lex.yy.c -lfl
./<examplefile>
