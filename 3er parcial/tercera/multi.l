%{
#include <stdio.h>
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMERO; }
"*"         { return MULTIPLICACION; }
"salir"     { return SALIR; }
[ \t\n]     ;  // Ignorar espacios y saltos de línea
.           { printf("Error: Carácter inválido '%s'\n", yytext); }

%%

int yywrap() {
    return 1;
}