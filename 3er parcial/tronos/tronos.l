%option noyywrap
%{
#include <stdio.h>
int Westeros = 0, Invernalia = 0, Desembarco_del_Rey = 0, Nido_de_Aguilas = 0, Altojardin = 0, Aguasdulces = 0, Rocadragon = 0, Roca_Casterly = 0, Bastion_de_Tormentas = 0, Dorne = 0;
int Stark = 0, Arryn = 0, Tully = 0, Greyjoy = 0, Lannister = 0, Tyrell = 0, Martell = 0, Baratheon = 0, Targaryen = 0;
int Eddard_Stark = 0, Catelyn_Stark = 0, Arya_Stark = 0, Sansa_Stark = 0;  // Casa Stark
int Robert_Baratheon = 0, Joffrey_Baratheon = 0, Stannis_Baratheon = 0;   // Casa Baratheon
int Aegon_Targaryen = 0, Daenerys_Targaryen = 0, Aerys_Targaryen = 0;     // Casa Targaryen
int Tywin_Lannister = 0, Jaime_Lannister = 0, Tyrion_Lannister = 0, Cersei_Lannister = 0;  // Casa Lannister

// Declaración de la funciónle
void imprimirLugaresJuegoDeTronos();
void imprimirCasasPrincipales();
void imprimirCasaStark();
void imprimirCasaBaratheon();
void imprimirCasaTargaryen();
void imprimirCasaLannister();
%}

%%
[Ww]"esteros" { Westeros++; } 
[In]"vernalia" { Invernalia++; } 
[Dd]"esembarco del "[Rr]"ey" { Desembarco_del_Rey++; }
[Nn]"ido "[Dd]"e "(\xC3\x81|\xC3\xA1|A|a)"guilas" { Nido_de_Aguilas++; }
[Aa]"ltojard"(\xC3\xAD|i)"n" { Altojardin++; }
[Aa]"guasdulces" { Aguasdulces++; }
[Rr]"ocadrag"([oO]|\xC3\xB3)"n"         { Rocadragon++; }
[Rr]"oca Casterly" { Roca_Casterly++; }
[Bb]"asti"([oO]|\xC3\xB3)"n de "[Tt]"ormentas" { Bastion_de_Tormentas++; }
[Dd]orne                  { Dorne++; }

[Ss]tark { Stark++; }
[Aa]rryn { Arryn++; }
[Tt]ully { Tully++; }
[Gg]reyjoy { Greyjoy++; }
[Ll]annister { Lannister++; }
[Tt]yrell { Tyrell++; }
[Mm]artell { Martell++; }
[Bb]aratheon { Baratheon++; }
[Tt]argaryen { Targaryen++; }

[Ee]ddard { Eddard_Stark++; }
[Cc]atelyn { Catelyn_Stark++; }
[Aa]rya { Arya_Stark++; }
[Ss]ansa { Sansa_Stark++; }

[Rr]obert { Robert_Baratheon++; }
[Jj]offrey { Joffrey_Baratheon++; }
[Ss]tannis { Stannis_Baratheon++; }

[Aa]egon { Aegon_Targaryen++; }
[Dd]aenerys { Daenerys_Targaryen++; }
[Aa]erys { Aerys_Targaryen++; }

[Tt]ywin { Tywin_Lannister++; }
[Jj]aime { Jaime_Lannister++; }
[Tt]yrion { Tyrion_Lannister++; }
[Cc]ersei { Cersei_Lannister++; }

.|\n    { }
%%

void imprimirLugaresJuegoDeTronos() {
    int total = Westeros + Invernalia + Desembarco_del_Rey + Nido_de_Aguilas + Altojardin + Aguasdulces + Rocadragon + Roca_Casterly + Bastion_de_Tormentas + Dorne;

    printf("Lugares Juego de Tronos (Total: %d):\n\n", total);
    printf("Westeros: %d (%.2f%%)\n", Westeros, (total > 0) ? (Westeros * 100.0 / total) : 0);
    printf("Invernalia: %d (%.2f%%)\n", Invernalia, (total > 0) ? (Invernalia * 100.0 / total) : 0);
    printf("Desembarco del Rey: %d (%.2f%%)\n", Desembarco_del_Rey, (total > 0) ? (Desembarco_del_Rey * 100.0 / total) : 0);
    printf("Nido de Águilas: %d (%.2f%%)\n", Nido_de_Aguilas, (total > 0) ? (Nido_de_Aguilas * 100.0 / total) : 0);
    printf("Altojardín: %d (%.2f%%)\n", Altojardin, (total > 0) ? (Altojardin * 100.0 / total) : 0); 
    printf("Aguasdulces: %d (%.2f%%)\n", Aguasdulces, (total > 0) ? (Aguasdulces * 100.0 / total) : 0);
    printf("Rocadragón: %d (%.2f%%)\n", Rocadragon, (total > 0) ? (Rocadragon * 100.0 / total) : 0);
    printf("Roca Casterly: %d (%.2f%%)\n", Roca_Casterly, (total > 0) ? (Roca_Casterly * 100.0 / total) : 0);
    printf("Bastión de Tormentas: %d (%.2f%%)\n", Bastion_de_Tormentas, (total > 0) ? (Bastion_de_Tormentas * 100.0 / total) : 0);
    printf("Dorne: %d (%.2f%%)\n", Dorne, (total > 0) ? (Dorne * 100.0 / total) : 0);
}


void imprimirCasasPrincipales() {
    int totalCasas = Stark + Arryn + Tully + Greyjoy + Lannister + Tyrell + Martell + Baratheon + Targaryen;

    printf("\nCasas Principales (Total: %d):\n\n", totalCasas);
    printf("Stark: %d (%.2f%%)\n", Stark, (totalCasas > 0) ? (Stark * 100.0 / totalCasas) : 0);
    printf("Arryn: %d (%.2f%%)\n", Arryn, (totalCasas > 0) ? (Arryn * 100.0 / totalCasas) : 0);
    printf("Tully: %d (%.2f%%)\n", Tully, (totalCasas > 0) ? (Tully * 100.0 / totalCasas) : 0);
    printf("Greyjoy: %d (%.2f%%)\n", Greyjoy, (totalCasas > 0) ? (Greyjoy * 100.0 / totalCasas) : 0);
    printf("Lannister: %d (%.2f%%)\n", Lannister, (totalCasas > 0) ? (Lannister * 100.0 / totalCasas) : 0);
    printf("Tyrell: %d (%.2f%%)\n", Tyrell, (totalCasas > 0) ? (Tyrell * 100.0 / totalCasas) : 0);
    printf("Martell: %d (%.2f%%)\n", Martell, (totalCasas > 0) ? (Martell * 100.0 / totalCasas) : 0);
    printf("Baratheon: %d (%.2f%%)\n", Baratheon, (totalCasas > 0) ? (Baratheon * 100.0 / totalCasas) : 0);
    printf("Targaryen: %d (%.2f%%)\n", Targaryen, (totalCasas > 0) ? (Targaryen * 100.0 / totalCasas) : 0);
}

void imprimirCasaStark() {
    int totalStark = Eddard_Stark + Catelyn_Stark + Arya_Stark + Sansa_Stark;

    printf("\nCasa Stark (Total: %d):\n\n", totalStark);
    printf("Eddard: %d (%.2f%%)\n", Eddard_Stark, (totalStark > 0) ? (Eddard_Stark * 100.0 / totalStark) : 0);
    printf("Catelyn: %d (%.2f%%)\n", Catelyn_Stark, (totalStark > 0) ? (Catelyn_Stark * 100.0 / totalStark) : 0);
    printf("Arya: %d (%.2f%%)\n", Arya_Stark, (totalStark > 0) ? (Arya_Stark * 100.0 / totalStark) : 0);
    printf("Sansa: %d (%.2f%%)\n", Sansa_Stark, (totalStark > 0) ? (Sansa_Stark * 100.0 / totalStark) : 0);
}

void imprimirCasaBaratheon() {
    int totalBaratheon = Robert_Baratheon + Joffrey_Baratheon + Stannis_Baratheon;

    printf("\nCasa Baratheon (Total: %d):\n\n", totalBaratheon);
    printf("Robert: %d (%.2f%%)\n", Robert_Baratheon, (totalBaratheon > 0) ? (Robert_Baratheon * 100.0 / totalBaratheon) : 0);
    printf("Joffrey: %d (%.2f%%)\n", Joffrey_Baratheon, (totalBaratheon > 0) ? (Joffrey_Baratheon * 100.0 / totalBaratheon) : 0);
    printf("Stannis: %d (%.2f%%)\n", Stannis_Baratheon, (totalBaratheon > 0) ? (Stannis_Baratheon * 100.0 / totalBaratheon) : 0);
}

void imprimirCasaTargaryen() {
    int totalTargaryen = Aegon_Targaryen + Daenerys_Targaryen + Aerys_Targaryen;

    printf("\nCasa Targaryen (Total: %d):\n\n", totalTargaryen);
    printf("Aegon: %d (%.2f%%)\n", Aegon_Targaryen, (totalTargaryen > 0) ? (Aegon_Targaryen * 100.0 / totalTargaryen) : 0);
    printf("Daenerys: %d (%.2f%%)\n", Daenerys_Targaryen, (totalTargaryen > 0) ? (Daenerys_Targaryen * 100.0 / totalTargaryen) : 0);
    printf("Aerys: %d (%.2f%%)\n", Aerys_Targaryen, (totalTargaryen > 0) ? (Aerys_Targaryen * 100.0 / totalTargaryen) : 0);
}

void imprimirCasaLannister() {
    int totalLannister = Tywin_Lannister + Jaime_Lannister + Tyrion_Lannister + Cersei_Lannister;

    printf("\nCasa Lannister (Total: %d):\n\n", totalLannister);
    printf("Tywin: %d (%.2f%%)\n", Tywin_Lannister, (totalLannister > 0) ? (Tywin_Lannister * 100.0 / totalLannister) : 0);
    printf("Jaime: %d (%.2f%%)\n", Jaime_Lannister, (totalLannister > 0) ? (Jaime_Lannister * 100.0 / totalLannister) : 0);
    printf("Tyrion: %d (%.2f%%)\n", Tyrion_Lannister, (totalLannister > 0) ? (Tyrion_Lannister * 100.0 / totalLannister) : 0);
    printf("Cersei: %d (%.2f%%)\n", Cersei_Lannister, (totalLannister > 0) ? (Cersei_Lannister * 100.0 / totalLannister) : 0);
}

int main(int argc, char **argv) {
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
    imprimirLugaresJuegoDeTronos();
    imprimirCasasPrincipales();
    imprimirCasaStark();
    imprimirCasaBaratheon();
    imprimirCasaTargaryen();
    imprimirCasaLannister();

    return 0;
}