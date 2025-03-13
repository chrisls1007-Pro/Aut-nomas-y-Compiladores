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
    printf("Reconocer numeros enteros\n\n");
    printf("Comenzando\n\n");
    return yylex();
}
