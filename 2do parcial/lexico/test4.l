%option noyywrap
%{
    #include <stdio.h>
%}

%%
^[A-Z�&]{4}[0-9]{6}[A-Z0-9]{3}$  { printf("reconocido RFC (Persona F�sica): %s\n", yytext); }
.*                               { printf("NO es RFC (valor invalido): %s\n", yytext); }

%%
int main()
{
    printf("Reconocer RFC\n\n");
    printf("Comenzando\n\n");
    return yylex();
}
