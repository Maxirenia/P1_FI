#!/bin/bash

cut -d "," --complement -f 12,16 < supervivents.csv > sortidapas1.csv

lin1=$(wc -l < sortida.csv)
awk -F',' '{if($14 == "False" || NR == 1) print $0}' sortidapas1.csv > sortidapas2.csv
lin2=$(wc -l < sortidapas2.csv)
eliminats=$(($lin1 - $lin2))
echo "Número de línies esborrades:" $eliminats

awk -F',' 'NR == 1 {print $0 ",Ranking_views"}
NR != 1 {
    if ($8 < 1000000) {
        missatge = ",Bo"
    } else if ($8 >= 1000000 && $8 <= 10000000) {
        missatge = ",Excel·lent"
    } else {
        missatge = ",Estrella"
    }
    print $0 missatge
}' sortidapas2.csv > sortidapas3.csv
