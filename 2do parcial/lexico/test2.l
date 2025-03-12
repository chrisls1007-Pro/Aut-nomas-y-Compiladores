%option noyywrap
%{
    #include <stdio.h>
%}

%%
^[-+]?[0-9]+\.[0-9]+$ { printf("reconocido DECIMAL: %s\n", yytext); }
.*                     { printf("NO es DECIMAL (valor invalido): %s\n", yytext); }

%%

int main()
{
    printf("Reconocer numeros decimales\n\n");
    printf("Comenzando\n\n");
    return yylex();
}
