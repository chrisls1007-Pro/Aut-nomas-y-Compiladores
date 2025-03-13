%option noyywrap
%{
    #include <stdio.h>
    #include <ctype.h>
    #include <string.h>

    const char *reservadas[] = {
        "auto", "break", "case", "const", "continue", "default",
        "do", "else", "extern", "for", "goto",
        "if", "inline", "long", 
        "register", "restrict", "return",
        "short", "signed", "sizeof", "static", "struct", "switch", "typedef",
        "union", "unsigned", "volatile", "while", "_Alignas",
        "_Alignof", "_Atomic", "_Bool", "_Complex", "_Generic", "_Imaginary",
        "_Noreturn", "_Static_assert", "_Thread_local"
        
    };

    // "int", "float", "double", "char", "void", "bool", "_Bool"
    // estas de arriba, son tanto reservadas como tipos de datos, pero obtene por dejarlas en tipos de datos

    const char *tipos_datos[] = {
        "int", "float", "double", "char", "void", "short", "long", 
        "signed", "unsigned", "struct", "union", "enum", "bool", "_Bool",
        "size_t", "ptrdiff_t", "wchar_t", "intptr_t", "uintptr_t"
    };


    int palabra_reservada(const char *word) {
        int i;
        for (i = 0; i < sizeof(reservadas) / sizeof(reservadas[0]); i++) {
            if (strcmp(word, reservadas[i]) == 0) return 1;
        }
        return 0;
    }

    int tipo_dato(const char *word) {
        int i;
        for (i = 0; i < sizeof(tipos_datos) / sizeof(tipos_datos[0]); i++) {
            if (strcmp(word, tipos_datos[i]) == 0) return 1;
        }
        return 0;
    }

    int variable(const char *word) {
	if (!isalpha(word[0]) && word[0] != '_') return 0;
	int i;
	for (i = 1; word[i]; i++) {
	      if (!isalnum(word[i]) && word[i] != '_') return 0;
	}
	return 1; // Cumple las reglas, es una variable válida
    }
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* {
    if (palabra_reservada(yytext)) {
        printf("Palabra reservada encontrada: %s\n", yytext);
    } else if (tipo_dato(yytext)) {
        printf("Tipo de dato encontrado: %s\n", yytext);
    } else if (variable(yytext)) {
        printf("Variable encontrada: %s\n", yytext);
    }
}

.|\n    { }
%%

int main(int argc, char **argv) {
    printf("Reconocer las palabras reservadas del lenguaje de programacion C, variables y tipos de datos\n\n");
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
