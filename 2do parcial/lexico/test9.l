%option noyywrap
%{
    #include <stdio.h>
    #include <ctype.h>
    #include <string.h>

    void analizar_palabra(const char *word) {
        const char *verbos[] = {
            "analizar", "abstraer", "aislar", "calcular", "categorizar",
            "contrastar", "criticar", "comparar", "debatir", "describir",
            "descomponer", "designar", "detallar", "determinar", "descubrir",
            "desglosar", "detectar", "diferenciar", "discriminar", "distinguir",
            "dividir", "enunciar", "especificar", "examinar", "experimentar",
            "explicar", "fraccionar", "identificar", "ilustrar", "inferir",
            "investigar", "omitir", "relacionar", "seleccionar", "señalar",
            "separar", "seccionar", "reflexionar"
        };

        const char *adjetivos[] = {
            "hermoso", "brillante", "genial", "excelente", "maravilloso",
            "amable", "fabuloso", "sabio", "valiente", "eficaz"
        };

        const char *conjunciones[] = {
            "y", "o", "pero", "aunque", "sino", "que", "pues", "como", "cuando"
        };

        const char *preposiciones[] = {
            "a", "ante", "bajo", "cabe", "con", "contra", "de", "desde", "en",
            "entre", "hacia", "hasta", "para", "por", "según", "sin", "so",
            "sobre", "tras"
        };

        const char *pronombres[] = {
            "yo", "tú", "él", "ella", "nosotros", "vosotros", "ellos",
            "ellas", "usted", "ustedes"
        };

        int i;

        for (i = 0; i < 38; i++) {
            if (strcasecmp(word, verbos[i]) == 0) {
                printf("Verbo de analisis encontrado: %s\n", word);
                return;
            }
        }

        for (i = 0; i < 10; i++) {
            if (strcasecmp(word, adjetivos[i]) == 0) {
                printf("Adjetivo positivo encontrado: %s\n", word);
                return;
            }
        }

        for (i = 0; i < 9; i++) {
            if (strcasecmp(word, conjunciones[i]) == 0) {
                printf("Conjuncion encontrada: %s\n", word);
                return;
            }
        }

        for (i = 0; i < 19; i++) {
            if (strcasecmp(word, preposiciones[i]) == 0) {
                printf("Preposicion encontrada: %s\n", word);
                return;
            }
        }

        for (i = 0; i < 10; i++) {
            if (strcasecmp(word, pronombres[i]) == 0) {
                printf("Pronombre encontrado: %s\n", word);
                return;
            }
        }
    }
%}

%%
[a-zA-Z]+   { analizar_palabra(yytext); }
.|\n        { }
%%

int main(int argc, char **argv) {
    printf("Reconocer verbos de la taxonomia de bloom categoria analizar, adjetivos calificativos positivos, conjunciones, preposiciones y pronombres\n\n");
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
