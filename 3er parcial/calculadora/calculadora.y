%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char *s);
%}

%union {
    double num;  
}

%token <num> NUM
%token SUMA RESTA MULT DIV

%start sentences

%%

sentences:
    sentence sentences
    | /* vacío */
;

sentence:
    NUM SUMA NUM { 
        printf("Tokens: [NUM: %g] [SIGNO: +] [NUM: %g]\n", $1, $3);
        printf("Resultado: %g + %g = %g\n\n", $1, $3, $1 + $3); 
    }
    | NUM RESTA NUM { 
        printf("Tokens: [NUM: %g] [SIGNO: -] [NUM: %g]\n", $1, $3);
        printf("Resultado: %g - %g = %g\n\n", $1, $3, $1 - $3); 
    }
    | NUM MULT NUM { 
        printf("Tokens: [NUM: %g] [SIGNO: *] [NUM: %g]\n", $1, $3);
        printf("Resultado: %g * %g = %g\n\n", $1, $3, $1 * $3); 
    }
    | NUM DIV NUM { 
        if ($3 == 0.0) {
            yyerror("Error: División entre cero");
        } else {
            printf("Tokens: [NUM: %g] [SIGNO: /] [NUM: %g]\n", $1, $3);
            printf("Resultado: %g / %g = %g\n\n", $1, $3, $1 / $3); 
        }
    }
;

%%

int yyerror(char* s) {
    fprintf(stderr, "Error: %s\n", s);
    return 1;
}

int main() {
    printf("Presiona Ctrl+D (Linux/Mac) o Ctrl+Z (Windows) para salir.\n\n");
    
    while (!feof(stdin)) {
        printf("> ");
        yyparse();
    }
    
    printf("\nFin del programa.\n");
    return 0;
}