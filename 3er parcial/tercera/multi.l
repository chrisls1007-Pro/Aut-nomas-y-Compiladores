%{
#include <stdio.h>
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMERO; }
"*"         { return MULTIPLICACION; }
"salir"     { return SALIR; }
[ \t\n]     ;  // Ignorar espacios y saltos de l�nea
.           { printf("Error: Car�cter inv�lido '%s'\n", yytext); }

%%

int yywrap() {
    return 1;
}