%{
#include <stdio.h>
#include "y.tab.h"
#include <stdlib.h>
#include <string.h> 
%}

%%

[0-9]+          { yylval.num = atoi(yytext); return NUM; }
[0-9]+\.[0-9]+  { yylval.num = strtod(yytext, NULL); return NUM; }
"+"             { return SUMA; }
"-"             { return RESTA; }
"*"             { return MULT; }
"/"             { return DIV; }
[ \t\n\f\r]+    {  }
.               { return *yytext; }

%%

int yywrap() {
    return 1;
}