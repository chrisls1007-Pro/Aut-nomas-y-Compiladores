%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%token NUMERO
%token MULTIPLICACION
%token SALIR

%%

inicio:
    | inicio expresion
    | inicio SALIR { printf("Programa terminado.\n"); exit(0); }
    ;

expresion:
    NUMERO MULTIPLICACION NUMERO { 
        printf("Resultado: %d * %d = %d\n", $1, $3, $1 * $3); 
    }
    | error { yyerror("Expresión inválida. Use: 'num * num' o 'salir'"); }
    ;

%%

int main() {
    printf("Ingrese expresiones ('n * n') o 'salir' para terminar:\n");
    yyparse();
    return 0;
}