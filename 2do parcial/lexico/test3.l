%option noyywrap
%{
    #include <stdio.h>
%}

%%
^[a-zA-Z][a-zA-Z0-9_]*$    { printf("reconocido IDENTIFICADOR: %s\n", yytext); }
.*                         { printf("NO es IDENTIFICADOR (valor invalido): %s\n", yytext); }

%%
int main()
{
    printf("Reconocer variables (identificadores). Inician con una letra y despues puede tener letra, numeros y guiones bajos _\n\n");
    printf("Comenzando\n\n");
    return yylex();
}
