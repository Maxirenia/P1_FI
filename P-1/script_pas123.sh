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

count=0
while read -r linia
do
    if [ $count -eq 0 ]; then
        echo "$linia,Rlikes,Rdislikes" > sortidapas4.csv
        count=$((count+1))
    else
        likes=$(cut -d "," -f 9 <<< "$linia")
        dislikes=$(cut -d "," -f 10 <<< "$linia")
        views=$(cut -d "," -f 8 <<< "$linia")
        if [ $views -eq 0 ]; then
            rlikes=0
            rdislikes=0
        else
            rlikes=$((likes*100/views))
            rdislikes=$((dislikes*100/views))
        fi
        echo "$linia,$rlikes,$rdislikes" >> sortidapas4.csv
    fi
done < sortidapas3.csv

    
