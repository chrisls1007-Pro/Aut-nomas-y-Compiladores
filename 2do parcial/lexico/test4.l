%option noyywrap
%{
    #include <stdio.h>
%}

%%
^[A-ZÑ&]{4}[0-9]{6}[A-Z0-9]{3}$  { printf("reconocido RFC (Persona Física): %s\n", yytext); }
.*                               { printf("NO es RFC (valor invalido): %s\n", yytext); }

%%
int main()
{
    printf("Reconocer RFC\n\n");
    printf("Comenzando\n\n");
    return yylex();
}
