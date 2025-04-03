%option noyywrap
%{
#include <stdio.h>
int lineas = 1;
int palabras = 0;
int caracteres = 0;
int palabras_ni = 0;
int palabras_num = 0;
int palabras_b_to = 0;
int palabras_jo = 0;
int numeros = 0;
int total_digits = 0;
int total_carac = 0;

// Declaración de la funciónle
void imprimirResultados();
%}

%%
 // palabras con acento, junto con la ñ son cambiadas con su valor hexadecimal para su validacion correcta
[Nn][iI][a-zA-Z\xC3\xA1\xC3\xA9\xC3\xAD\xC3\xB3\xC3\xBA\xC3\x81\xC3\x89\xC3\x8D\xC3\x93\xC3\x9A\xC3\xB1\xC3\x910-9]* { total_carac += yyleng; palabras_ni++; } // Contar palabras que comienzan con NIQ
[Nn]([uU]|\xC3\xBA|\xC3\x9A)[mM][a-zA-Z\xC3\xA1\xC3\xA9\xC3\xAD\xC3\xB3\xC3\xBA\xC3\x81\xC3\x89\xC3\x8D\xC3\x93\xC3\x9A\xC3\xB1\xC3\x910-9]* { total_carac += yyleng; palabras_num++; } //Contar palabras 
[Bb][a-zA-Z\xC3\xA1\xC3\xA9\xC3\xAD\xC3\xB3\xC3\xBA\xC3\x81\xC3\x89\xC3\x8D\xC3\x93\xC3\x9A\xC3\xB1\xC3\x910-9]*[tT][oO] { total_carac += yyleng; palabras_b_to++; } // Contar palabras que comienzan con B y terminan con TO
[a-zA-Z\xC3\xA1\xC3\xA9\xC3\xAD\xC3\xB3\xC3\xBA\xC3\x81\xC3\x89\xC3\x8D\xC3\x93\xC3\x9A\xC3\xB1\xC3\x910-9]*[jJ][oO] { total_carac += yyleng; palabras_jo++; } // Contar palabras que terminan JO
[0-9]+ { total_digits += yyleng; numeros++; } // Total digitos, total numeros               
[a-zA-Z\xC3\xA1\xC3\xA9\xC3\xAD\xC3\xB3\xC3\xBA\xC3\x81\xC3\x89\xC3\x8D\xC3\x93\xC3\x9A\xC3\xB1\xC3\x910-9]+ { total_carac += yyleng; palabras++; }  // Contar palabras
\n              { lineas++; }  // Contar líneas
.               { caracteres++; }
%%

void imprimirResultados() {
    printf("Total de líneas: %d\n", lineas);
    printf("Total de palabras: %d\n", palabras + palabras_ni + palabras_num + palabras_b_to + palabras_jo + numeros);
    printf("Total de caracteres: %d\n", caracteres + total_carac + total_digits);
    printf("Total de palabras que comienzan con NI: %d\n", palabras_ni);
    printf("Total de palabras que comienzan con NUM: %d\n", palabras_num);
    printf("Total de palabras que comienzan con B y terminan con TO: %d\n", palabras_b_to);
    printf("Total de palabras que terminan con JO: %d\n", palabras_jo);
    printf("Total de numeros: %d\n", numeros);
    printf("Total de digitos: %d\n", total_digits);
}

int main(int argc, char **argv) {
    printf("Conteo de aspectos\n\n");
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

    // Llamar a la función para imprimir los resultados
    imprimirResultados();
    return 0;
}
