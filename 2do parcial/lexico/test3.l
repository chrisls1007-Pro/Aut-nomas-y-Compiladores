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
    return yylex();
}
