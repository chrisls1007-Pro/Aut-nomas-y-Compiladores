%option noyywrap
%{
    #include <stdio.h>
%}

%%
^[+-]?[0-9]+$   { printf("reconocido ENTERO: %s\n", yytext); }
.*               { printf("NO es ENTERO (valor invalido): %s\n", yytext); }

%%
int main()
{
    return yylex();
}
