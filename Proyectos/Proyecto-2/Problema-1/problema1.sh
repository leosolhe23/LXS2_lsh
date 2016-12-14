#!/bin/bash

DATA=/home/sysadmin/Documents/problema1/hojasDatos
OUT_DATA=$DATA/archivos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos


mkdir $DATA/archivos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA

m=0

for i in `find $DATA -name '*.xls'`
do
	echo "Procesando archivo $i"
	xls2csv $i > $OUT_DATA/data-$m.csv
	let m=m+1
done 2> error1.log

m=0

for e in `find $OUT_DATA -name "*.csv"`
do
	echo "Dando formato de datos para graficar el archivo $e"
	cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5}' | sed '1,$ s/"//g' | sed '1 s/date/#date/g' > $GRAF_DATA/graf-$m.dat
	let m=m+1
 
done 2> error2.log

m=0
for k in `find $GRAF_DATA -name "*.dat"`
do
        echo "borrando primer linea archivo"
        echo $k
	sed '1d' $k >> $FULL_DATA/full.dat
	let m=m+1
done
2>error3.log

