%option noyywrap
%{
    #include <stdio.h>
    #include <ctype.h>
    #include <string.h>

    void analizar_verbo(const char *word, const char *verb) {
        char temp[100];
        int i;
        strcpy(temp, word);
        for (i = 0; temp[i]; i++) temp[i] = tolower(temp[i]);
        if (strcmp(temp, verb) == 0) {
            printf("Verbo de aplicacipn encontrado: %s\n", word);
        }
    }
%}

%%
[a-zA-Z]+ { 
    analizar_verbo(yytext, "aplicar");
    analizar_verbo(yytext, "aprovechar");
    analizar_verbo(yytext, "calcular");
    analizar_verbo(yytext, "cambiar");
    analizar_verbo(yytext, "construir");
    analizar_verbo(yytext, "comprobar");
    analizar_verbo(yytext, "delinear");
    analizar_verbo(yytext, "demostrar");
    analizar_verbo(yytext, "describir");
    analizar_verbo(yytext, "despejar");
    analizar_verbo(yytext, "determinar");
    analizar_verbo(yytext, "discriminar");
    analizar_verbo(yytext, "diseñar");
    analizar_verbo(yytext, "distinguir");
    analizar_verbo(yytext, "dramatizar");
    analizar_verbo(yytext, "ejemplificar");
    analizar_verbo(yytext, "eliminar");
    analizar_verbo(yytext, "emplear");
    analizar_verbo(yytext, "encontrar");
    analizar_verbo(yytext, "esbozar");
    analizar_verbo(yytext, "estimar");
    analizar_verbo(yytext, "estructurar");
    analizar_verbo(yytext, "explicar");
    analizar_verbo(yytext, "ilustrar");
    analizar_verbo(yytext, "interpolar");
    analizar_verbo(yytext, "inventariar");
    analizar_verbo(yytext, "manejar");
    analizar_verbo(yytext, "manipular");
    analizar_verbo(yytext, "medir");
    analizar_verbo(yytext, "modificar");
    analizar_verbo(yytext, "mostrar");
    analizar_verbo(yytext, "obtener");
    analizar_verbo(yytext, "operar");
    analizar_verbo(yytext, "organizar");
    analizar_verbo(yytext, "practicar");
    analizar_verbo(yytext, "preparar");
    analizar_verbo(yytext, "probar");
    analizar_verbo(yytext, "producir");
    analizar_verbo(yytext, "relacionar");
    analizar_verbo(yytext, "representar");
    analizar_verbo(yytext, "resolver");
    analizar_verbo(yytext, "redactar");
    analizar_verbo(yytext, "tabular");
    analizar_verbo(yytext, "trazar");
    analizar_verbo(yytext, "seguir");
    analizar_verbo(yytext, "transferir");
    analizar_verbo(yytext, "usar");
    analizar_verbo(yytext, "utilizar");
}

.|\n { }
%%

int main(int argc, char **argv) {
    printf("Reconocer los verbos de la taxonomia de bloom categoria aplicacion\n\n");
    printf("Comenzando\n\n");
    if (argc != 2) {
        printf("Uso: %s <archivo>\n", argv[0]);
        return 1;
    }
    FILE *f = fopen(argv[1], "r");
    if (f == NULL) {
        perror("Error al abrir el archivo");
        return 1;
    }
    yyin = f;
    yylex();
    fclose(f);
    return 0;
}

