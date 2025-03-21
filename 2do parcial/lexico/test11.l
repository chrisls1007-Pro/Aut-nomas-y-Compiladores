%{
#include <stdio.h>
%}

%option noyywrap

%%

\"([^\"\n]*)\"          { printf("Texto reconocido entre comillas: %s\n", yytext); }
"//".*                  { printf("Comentario de una l�nea: %s\n", yytext); }

\/\*([^*]|\*+[^*/])*\*\/  { printf("Comentario de m�ltiples l�neas: %s\n", yytext); }


[ \t\n]+                { /* Ignorar espacios y saltos de l�nea */ }
.|\n                    { }  // Ignorar otros caracteres.

%%

int main(int argc, char **argv) {
    printf("Reconocer comentarios y texto que se presenta en pantalla de acuerdo con la sintaxis del lenguaje de programaci�n C\n\n");
    printf("Comenzando\n\n");

    if (argc != 2) {
        printf("Uso: %s <archivo>\n", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");
    if (f == NULL) {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = f; 
    yylex();  
    fclose(f);
    return 0;
}
