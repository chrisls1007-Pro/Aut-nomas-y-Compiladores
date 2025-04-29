#ifndef STRUCT_H
#define STRUCT_H

typedef struct SymbTbl {
    char *column;
    char *table;
    int line;
    struct SymbTbl *next;
} symbtbl;

extern symbtbl *sym_table;
extern int current_line;

symbtbl *add_symbol(char *, char *, int);
symbtbl *get_symbol(char *);

#endif