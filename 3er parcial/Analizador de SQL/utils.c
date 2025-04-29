#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "struct.h"

symbtbl *sym_table = NULL;

symbtbl *add_symbol(char *col, char *tab, int line) {
    symbtbl *new = malloc(sizeof(symbtbl));
    if (!new) return NULL;
    
    new->column = strdup(col);
    new->table = strdup(tab);
    new->line = line;
    new->next = sym_table;
    sym_table = new;

    printf("Consulta procesada (Línea %d):\n", line);
    printf("  Operacion: %s\n", col);
    printf("  Tabla/Datos: %s\n\n", tab);

    FILE *f = fopen("results.txt", "a");
    if (f) {
        fprintf(f, "Línea %d:\n  Operación: %s\n  Tabla/Datos: %s\n\n", 
                line, col, tab);
        fclose(f);
    }
    return new;
}