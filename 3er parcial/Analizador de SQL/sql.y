%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "struct.h"

extern int current_line;
extern int yylex();
void yyerror(const char *s);
symbtbl *add_symbol(char *, char *, int);

%}

%union {
    char *str;
}

%token SELECT FROM WHERE AND OR DELETE UPDATE SET INSERT INTO VALUES
%token <str> IDENTIFIER NUMBER STRING
%token '*' ',' '=' '<' '>' ';' '(' ')'

%type <str> column_list table_list condition expr value_list select_columns

%%

input: /* empty */
     | input line
     ;

line: stmt ';' { printf("Consulta válida en línea %d\n", current_line); }
    | error { yyerror("Error de sintaxis"); }
    ;

stmt: select_stmt
    | insert_stmt
    | update_stmt
    | delete_stmt
    ;

select_stmt: SELECT select_columns FROM table_list opt_where {
               add_symbol($2, $4, current_line);
            }
           ;

select_columns: '*' { $$ = strdup("*"); }
              | column_list { $$ = $1; }
              ;

insert_stmt: INSERT INTO IDENTIFIER '(' column_list ')' VALUES '(' value_list ')' {
               char buffer[512];
               sprintf(buffer, "(%s) VALUES(%s)", $5, $9);
               add_symbol($3, buffer, current_line);
            }
           ;

delete_stmt: DELETE FROM IDENTIFIER opt_where {
               add_symbol("DELETE", $3, current_line);
            }
           ;

update_stmt: UPDATE IDENTIFIER SET IDENTIFIER '=' expr opt_where {
               char buffer[256];
               sprintf(buffer, "%s=%s", $4, $6);
               add_symbol($2, buffer, current_line);
            }
           ;

opt_where: 
         | WHERE condition
         ;

column_list: IDENTIFIER { $$ = $1; }
           | column_list ',' IDENTIFIER {
                 char *tmp = malloc(strlen($1) + strlen($3) + 2);
                 sprintf(tmp, "%s,%s", $1, $3);
                 $$ = tmp;
             }
           ;

table_list: IDENTIFIER { $$ = $1; }
          | table_list ',' IDENTIFIER {
                char *tmp = malloc(strlen($1) + strlen($3) + 2);
                sprintf(tmp, "%s,%s", $1, $3);
                $$ = tmp;
            }
          ;

condition: expr '=' expr { $$ = strdup("condition"); }
         | expr '<' expr { $$ = strdup("less than"); }
         | expr '>' expr { $$ = strdup("greater than"); }
         | condition AND condition { $$ = strdup("AND condition"); }
         | condition OR condition { $$ = strdup("OR condition"); }
         ;

expr: IDENTIFIER { $$ = $1; }
     | NUMBER { $$ = $1; }
     | STRING { $$ = $1; }
     ;

value_list: expr { $$ = $1; }
          | value_list ',' expr {
                char *tmp = malloc(strlen($1) + strlen($3) + 2);
                sprintf(tmp, "%s,%s", $1, $3);
                $$ = tmp;
            }
          ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error en línea %d: %s\n", current_line, s);
}

int main() {
    printf("Analizador SQL listo:\n");
    yyparse();
    return 0;
}