#!/bin/bash

cut -d "," --complement -f 12,16 < supervivents.csv > sortida.csv

lin1=$(wc -l < sortida.csv)
awk -F',' '{if($14 == "False" || NR == 1) print $0}' sortida.csv > novasortida.csv
lin2=$(wc -l < novasortida.csv)
eliminats=$(($lin1 - $lin2))
echo "Número de línies esborrades:" $eliminats
