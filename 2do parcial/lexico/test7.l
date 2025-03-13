%option noyywrap
%{
    #include <stdio.h>
    #include <ctype.h>
%}

%%
[a-zA-Z]   { printf("%c", tolower(yytext[0])); }   // Convierte a minúscula
.          { printf("%s", yytext); }               // Imprime otros caracteres sin cambios

%%
int main(int argc, char **argv) {
    printf("Convierte el texto a minusculas\n\n");
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
