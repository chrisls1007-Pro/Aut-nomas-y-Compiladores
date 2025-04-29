%{
#include <stdio.h>
#include <string.h>
#include "struct.h"
#include "y.tab.h"

int current_line = 1;

%}
%option noyywrap

%%
"SELECT"        return SELECT;
"FROM"          return FROM;
"WHERE"         return WHERE;
"AND"           return AND;
"OR"            return OR;
"DELETE"        return DELETE;
"UPDATE"        return UPDATE;
"SET"           return SET;
"INSERT"        return INSERT;
"INTO"          return INTO;
"VALUES"        return VALUES;

"*"             return '*';
","             return ',';
"="             return '=';
"<"             return '<';
">"             return '>';
";"             return ';';
"("             return '(';
")"             return ')';

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.str = strdup(yytext);
    return IDENTIFIER;
}

[0-9]+ {
    yylval.str = strdup(yytext);
    return NUMBER;
}

"'"([^']*)"'" {
    yylval.str = strdup(yytext);
    return STRING;
}

\n              { current_line++; }

[ \t]+          /* ignore whitespace */
.               { return yytext[0]; }
%%