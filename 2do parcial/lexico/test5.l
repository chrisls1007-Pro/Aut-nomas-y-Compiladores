%option noyywrap
%{
    #include <stdio.h>
%}

%%
^[A-Z]{4}[0-9]{6}[HM][A-Z]{2}[A-Z]{3}[0-9A-Z]{2}$  { printf("reconocido CURP: %s\n", yytext); }
.*                                                  { printf("NO es CURP (valor invalido): %s\n", yytext); }

%%
int main()
{
    printf("Reconocer CURP\n\n");
    printf("Comenzando\n\n");
    return yylex();
}
