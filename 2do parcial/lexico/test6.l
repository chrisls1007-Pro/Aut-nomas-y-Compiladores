%option noyywrap
%{
    #include <stdio.h>
%}

%%
^[a-zA-Z0-9]+([._a-zA-Z0-9]*[a-zA-Z0-9])?@[a-zA-Z0-9]+\.[a-zA-Z]{2,}\.mx$  { printf("reconocido EMAIL INSTITUCIONAL: %s\n", yytext); }
.*                                                                       { printf("NO es EMAIL INSTITUCIONAL (valor invalido): %s\n", yytext); }

%%
int main()
{
    printf("Reconocer email institucional\n\n");
    printf("Comenzando\n\n");
    return yylex();
}
